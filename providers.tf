terraform {
  required_version = ">= 1.5.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.23.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.11.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

provider "kubernetes" {
  # Configuración implícita usando el contexto actual de kubectl
  # Los valores se inyectan desde el archivo kubeconfig del usuario
}

provider "helm" {
  # Configuración implícita usando el contexto actual de kubectl
  kubernetes {
    # Los valores se inyectan desde el archivo kubeconfig del usuario
  }
}

provider "kubectl" {
  # Configuración implícita usando el contexto actual de kubectl
  load_config_file = true
}