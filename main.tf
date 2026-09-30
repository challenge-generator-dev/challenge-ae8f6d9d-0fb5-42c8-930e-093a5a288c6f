# Configuración principal de Terraform para el despliegue de la plataforma de microservicios
# Este archivo define la infraestructura como código usando Terraform con AWS como provider

terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubernetes = {
n      source  = "hashicorp/kubernetes"
      version = "~> 2.23"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.11"
    }
  }
  backend "s3" {
    bucket = "terraform-state-fintech-prod"
    key    = "kubernetes-platform/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Environment = var.environment
      Project     = "fintech-microservices-platform"
      ManagedBy   = "terraform"
    }
  }
}

# Proveedor de Kubernetes configurado para el cluster EKS
provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
  }
}

# Proveedor de Helm para instalar charts en el cluster
provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
    }
  }
}

# Módulo de EKS para crear el cluster de Kubernetes
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = "fintech-cluster-${var.environment}"
  cluster_version = "1.28"

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  eks_managed_node_group_defaults = {
    ami_type       = "AL2_x86_64"
    instance_types = ["t3.medium"]
  }

  eks_managed_node_groups = {
    microservices = {
      name = "microservices-node-group"
      instance_types = ["t3.medium"]
      capacity_type  = "ON_DEMAND"
      min_size       = 3
      max_size       = 10
      desired_size   = 3
      labels = {
        tier = "application"
      }
    }
    monitoring = {
      name = "monitoring-node-group"
      instance_types = ["t3.small"]
      capacity_type  = "ON_DEMAND"
      min_size       = 2
      max_size       = 5
      desired_size   = 2
      labels = {
        tier = "monitoring"
      }
    }
  }

  tags = {
    Environment = var.environment
    Project     = "fintech-microservices-platform"
  }
}

# Módulo de VPC para la infraestructura de red
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "fintech-vpc-${var.environment}"
  cidr = var.vpc_cidr

  azs             = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway     = true
  single_nat_gateway     = false
  one_nat_gateway_per_az = true

  tags = {
    Environment = var.environment
    Project     = "fintech-microservices-platform"
  }
}

# Instalación de ArgoCD mediante Helm
resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "2.9.3"
  namespace  = "argocd"
  create_namespace = true

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "server.ingress.enabled"
    value = "true"
  }

  set {
    name  = "server.ingress.hostname"
    value = "argocd.${var.dns_domain}"
  }

  set {
    name  = "server.ingress.className"
    value = "nginx"
  }

  depends_on = [module.eks]
}

# Instalación de Prometheus mediante Helm
resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  version    = "2.47.0"
  namespace  = "monitoring"
  create_namespace = true

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "server.retention"
    value = "30d"
  }

  set {
    name  = "server.persistentVolume.size"
    value = "50Gi"
  }

  set {
    name  = "alertmanager.enabled"
    value = "true"
  }

  depends_on = [module.eks]
}

# Instalación de Grafana mediante Helm
resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  version    = "10.2.0"
  namespace  = "monitoring"
  create_namespace = true

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "persistence.enabled"
    value = "true"
  }

  set {
    name  = "persistence.size"
    value = "10Gi"
  }

  set {
    name  = "admin.password"
    value = var.grafana_admin_password
  }

  set {
    name  = "ingress.enabled"
    value = "true"
  }

  set {
    name  = "ingress.hosts[0]"
    value = "grafana.${var.dns_domain}"
  }

  set {
    name  = "ingress.className"
    value = "nginx"
  }

  depends_on = [module.eks]
}

# Instalación de ingress-nginx para gestión de tráfico
resource "helm_release" "ingress_nginx" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "1.9.4"
  namespace  = "ingress-nginx"
  create_namespace = true

  set {
    name  = "controller.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-type"
    value = "nlb"
  }

  set {
    name  = "controller.ingressClassResource.default"
    value = "true"
  }

  depends_on = [module.eks]
}

# Configuración de Namespace para microservicios
resource "kubernetes_namespace" "microservices" {
  metadata {
    name = "microservices"
    labels = {
      "app.kubernetes.io/name"       = "microservices"
      "app.kubernetes.io/managed-by" = "terraform"
    }
  }
}

# Configuración de Namespace para ArgoCD
resource "kubernetes_namespace" "argocd_ns" {
  metadata {
    name = "argocd"
    labels = {
      "app.kubernetes.io/name"       = "argocd"
      "app.kubernetes.io/managed-by" = "terraform"
    }
  }
}

# Configuración de Namespace para monitoreo
resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
    labels = {
      "app.kubernetes.io/name"       = "monitoring"
      "app.kubernetes.io/managed-by" = "terraform"
    }
  }
}

# Output para obtener el endpoint de ArgoCD
output "argocd_url" {
  description = "URL de acceso a ArgoCD"
  value       = "https://argocd.${var.dns_domain}"
}

# Output para obtener el endpoint de Grafana
output "grafana_url" {
  description = "URL de acceso a Grafana"
  value       = "https://grafana.${var.dns_domain}"
}

# Output del nombre del cluster EKS
output "eks_cluster_name" {
  description = "Nombre del cluster EKS"
  value       = module.eks.cluster_name
}