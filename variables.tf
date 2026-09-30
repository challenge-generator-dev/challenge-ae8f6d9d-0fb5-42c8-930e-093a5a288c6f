variable "kubernetes_context" {
  description = "Contexto de Kubernetes a utilizar para los despliegues"
  type        = string
  default     = "default"
}

variable "argocd_namespace" {
  description = "Namespace donde se desplegará ArgoCD"
  type        = string
  default     = "argocd"
}

variable "microservices_namespace" {
  description = "Namespace donde se desplegarán los microservicios"
  type        = string
  default     = "microservices"
}

variable "monitoring_namespace" {
  description = "Namespace donde se desplegarán Prometheus y Grafana"
  type        = string
  default     = "monitoring"
}

variable "argocd_version" {
  description = "Versión de ArgoCD a desplegar"
  type        = string
  default     = "2.9.3"
}

variable "prometheus_version" {
  description = "Versión de Prometheus a desplegar"
  type        = string
  default     = "2.47.0"
}

variable "grafana_version" {
  description = "Versión de Grafana a desplegar"
  type        = string
  default     = "10.2.0"
}

variable "ingress_nginx_version" {
  description = "Versión de Ingress Nginx a desplegar"
  type        = string
  default     = "1.9.4"
}

variable "cluster_domain" {
  description = "Dominio base del cluster para los servicios"
  type        = string
  default     = "cluster.local"
}