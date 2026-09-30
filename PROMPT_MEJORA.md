# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener un ZIP con el proyecto completo y arrancable.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `k8s/manifests/namespace.yaml` — El topic pide contenedores/orquestacion: este archivo es el ejercicio, no scaffolding.
- `k8s/helm/values.yaml` — El topic pide contenedores/orquestacion: este archivo es el ejercicio, no scaffolding.
- `k8s/argocd/application.yaml` — El topic pide contenedores/orquestacion: este archivo es el ejercicio, no scaffolding.
- `k8s/argocd/argocd-cm.yaml` — El topic pide contenedores/orquestacion: este archivo es el ejercicio, no scaffolding.
- `k8s/monitoring/prometheus/prometheus-config.yaml` — El topic pide contenedores/orquestacion: este archivo es el ejercicio, no scaffolding.
- `k8s/monitoring/prometheus/prometheus-deployment.yaml` — El topic pide contenedores/orquestacion: este archivo es el ejercicio, no scaffolding.
- `k8s/monitoring/grafana/grafana-dashboard.yaml` — El topic pide contenedores/orquestacion: este archivo es el ejercicio, no scaffolding.
- `k8s/monitoring/grafana/grafana-deployment.yaml` — El topic pide contenedores/orquestacion: este archivo es el ejercicio, no scaffolding.
- `k8s/microservices/auth-service/deployment.yaml` — El topic pide contenedores/orquestacion: este archivo es el ejercicio, no scaffolding.
- `k8s/microservices/auth-service/service.yaml` — El topic pide contenedores/orquestacion: este archivo es el ejercicio, no scaffolding.
- `k8s/microservices/auth-service/hpa.yaml` — El topic pide contenedores/orquestacion: este archivo es el ejercicio, no scaffolding.
- `k8s/microservices/user-service/deployment.yaml` — El topic pide contenedores/orquestacion: este archivo es el ejercicio, no scaffolding.
- `k8s/microservices/user-service/service.yaml` — El topic pide contenedores/orquestacion: este archivo es el ejercicio, no scaffolding.
- `k8s/microservices/transaction-service/deployment.yaml` — El topic pide contenedores/orquestacion: este archivo es el ejercicio, no scaffolding.
- `k8s/microservices/transaction-service/service.yaml` — El topic pide contenedores/orquestacion: este archivo es el ejercicio, no scaffolding.
- `k8s/microservices/transaction-service/configmap.yaml` — El topic pide contenedores/orquestacion: este archivo es el ejercicio, no scaffolding.

## Como saber que terminaste

```bash
docker build -t reto:local . && terraform -chdir=terraform init -backend=false && terraform -chdir=terraform validate
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Contexto técnico original
Diseñar y desplegar una plataforma de microservicios con Kubernetes, Helm, GitOps con ArgoCD y monitoreo con Prometheus y Grafana

### Reto
- Tema: Kubernetes DevOps
- Seniority: junior-l2
- Tipo: practical
- Título: Despliegue de una plataforma de microservicios con Kubernetes
- Tiempo estimado: 30 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Configuración inicial de Kubernetes — objetivo: Establecer un cluster de Kubernetes funcional y configurar Helm para gestionar los microservicios. — entregable (NO resolver): Cluster de Kubernetes configurado y Helm instalado.
- Fase 2: Implementación de GitOps con ArgoCD — objetivo: Configurar ArgoCD para gestionar el despliegue de los microservicios de manera idempotente. — entregable (NO resolver): ArgoCD configurado y sincronizando los microservicios desde el repositorio de Git.
- Fase 3: Configuración de monitoreo con Prometheus y Grafana — objetivo: Configurar Prometheus y Grafana para monitorear los microservicios y alertar sobre caídas de servicios en tiempo real. — entregable (NO resolver): Prometheus y Grafana configurados para monitorear y alertar sobre los microservicios.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (ZIP).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Exportación en ZIP
Empaqueta todos los archivos en un único archivo ZIP descargable respetando exactamente
la estructura de rutas indicada por los marcadores.
El ZIP debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: El ZIP debe estar listo para descargar al finalizar. No preguntes si el usuario
quiere generarlo. Simplemente genera el archivo y proporciona el enlace de descarga; No debes desplegar en el chat el resumen de lo que arreglaste al Zip, solo entregalo.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del enlace de descarga del ZIP
No preguntes si el usuario quiere el ZIP: simplemente generalo siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: providers.tf ===
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

// === ARCHIVO: variables.tf ===
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

// === ARCHIVO: k8s/argocd/application.yaml ===
# Configuración de ArgoCD para sincronizar el repositorio Git con el cluster Kubernetes
# Este archivo es la superficie de práctica del ejercicio.
# La configuración debe completarse para que ArgoCD sincronice correctamente los manifests
# de Kubernetes desde el repositorio Git.

apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: microservices-platform
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://github.com/empresa/microservices-platform.git
    targetRevision: HEAD
    path: k8s/manifests
    # TODO: Configurar el plugin de Helm si es necesario
    # helm:
    #   valueFiles:
    #     - values.yaml
  destination:
    server: https://kubernetes.default.svc
    namespace: microservices
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=true
      - ApplyOutOfSyncOnly=true


// === ARCHIVO: main.tf ===
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

// === ARCHIVO: README.md ===
# Plataforma de Microservicios - Kubernetes DevOps

Este repositorio contiene la infraestructura como código y configuración necesaria para desplegar una plataforma de microservicios en Kubernetes utilizando GitOps con ArgoCD y monitoreo con Prometheus y Grafana.

## Arquitectura de la Plataforma

La plataforma está diseñada para soportar 10,000 solicitudes por segundo con un SLA del 99.9% y está compuesta por los siguientes componentes:

### Componentes de Infraestructura
- **Amazon EKS**: Cluster de Kubernetes version 1.28
- **VPC**: Red virtual con subnets privadas y públicas en 3 AZs
- **Ingress NGINX**: Controlador de entrada para gestionar el tráfico externo
- **Helm**: Gestor de paquetes para Kubernetes

### Componentes de GitOps
- **ArgoCD**: Herramienta de despliegue continuo declarativo

### Componentes de Monitoreo
- **Prometheus**: Sistema de monitoreo y alertas
- **Grafana**: Plataforma de visualización de métricas

### Microservicios
- **Auth Service**: Servicio de autenticación
- **User Service**: Servicio de gestión de usuarios
- **Transaction Service**: Servicio de procesamiento de transacciones

## Prerrequisitos

Antes de comenzar, asegúrate de tener instaladas las siguientes herramientas:

```bash
# Terraform >= 1.6.0
terraform version

# AWS CLI configurado con credenciales
aws --version

# kubectl instalado
kubectl version --client

# Helm instalado
helm version

# eksctl instalado (opcional pero recomendado)
exctl version
```

## Configuración de Credenciales AWS

1. Configura tus credenciales de AWS:

```bash
aws configure
```

2. Asegúrate de tener los permisos necesarios para crear recursos en AWS.

## Despliegue de la Infraestructura

### Paso 1: Inicializar Terraform

```bash
cd terraform
terraform init
```

Este comando descarga los providers y módulos necesarios.

### Paso 2: Validar la configuración

```bash
terraform validate
terraform plan
```

El comando `terraform plan` muestra los recursos que se crearán. Revisa cuidadosamente antes de continuar.

### Paso 3: Aplicar la configuración

```bash
terraform apply
```

Este comando crea el cluster EKS, configura la red e instala ArgoCD, Prometheus, Grafana y el controlador de ingress.

El despliegue puede tomar entre 10 y 15 minutos.

### Paso 4: Configurar kubectl

Actualiza tu configuración de kubectl para conectar al nuevo cluster:

```bash
aws eks update-kubeconfig --name fintech-cluster-prod --region us-east-1
```

Verifica la conexión:

```bash
kubectl get nodes
kubectl get namespaces
```

## Configuración de ArgoCD

### Obtener la contraseña de ArgoCD

```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

### Acceder a ArgoCD

1. Obtiene el endpoint del servicio de ArgoCD:

```bash
kubectl get svc -n argocd argocd-server -o jsonpath="{.status.loadBalancer.ingress[0].hostname}"
```

2. Accede a la UI en: `https://argocd.<tu-dominio>`

3. Inicia sesión con:
   - Usuario: `admin`
   - Contraseña: La obtenida en el paso anterior

### Sincronizar Aplicaciones

ArgoCD sincronizará automáticamente los microservicios desde este repositorio. Para sincronizar manualmente:

```bash
argocd app sync microservices
```

## Configuración de Prometheus

### Acceder a Prometheus

```bash
kubectl get svc -n monitoring prometheus-server -o jsonpath="{.status.loadBalancer.ingress[0].hostname}"
```

Accede a la UI de Prometheus en el endpoint mostrado.

### Verificar targets de scrape

En la UI de Prometheus, navega a Status > Targets para ver los endpoints que Prometheus está monitoreando.

## Configuración de Grafana

### Obtener credenciales de Grafana

La contraseña de administrador se configuró durante el despliegue. Para obtenerla:

```bash
kubectl get secret -n monitoring grafana -o jsonpath="{.data.admin-password}" | base64 -d
```

### Acceder a Grafana

```bash
kubectl get svc -n monitoring grafana -o jsonpath="{.status.loadBalancer.ingress[0].hostname}"
```

Accede a Grafana en el endpoint mostrado e inicia sesión con:
- Usuario: `admin`
- Contraseña: La obtenida anteriormente

### Dashboards Preconfigurados

Grafana viene con dashboards preconfigurados para monitorear:
- Latencia de microservicios
- Tasa de errores
- Throughput de solicitudes
- Uso de recursos (CPU, memoria)

## Verificación de Microservicios

### Verificar que los pods están corriendo

```bash
kubectl get pods -n microservices
```

Deberías ver los pods de auth-service, user-service y transaction-service en estado Running.

### Verificar servicios

```bash
kubectl get svc -n microservices
```

### Probar los endpoints

Los microservicios están expuestos a través del ingress. Prueba los siguientes endpoints:

```bash
# Health check de auth-service
curl https://auth.<tu-dominio>/health

# Health check de user-service
curl https://users.<tu-dominio>/health

# Health check de transaction-service
curl https://transactions.<tu-dominio>/health
```

## Configuración de Autoscaling

Los microservicios están configurados con HPA (Horizontal Pod Autoscaler) para escalar automáticamente basándose en el uso de CPU:

```bash
kubectl get hpa -n microservices
```

Para modificar los umbrales de autoscaling:

```bash
kubectl edit hpa auth-service -n microservices
```

## Monitoreo y Alertas

### Reglas de alertas configuradas

Las siguientes alertas están configuradas en Prometheus:

- **HighErrorRate**: Alerta cuando la tasa de errores supera el 5%
- **HighLatency**: Alerta cuando la latencia p99 supera los 500ms
- **ServiceDown**: Alerta cuando un servicio no está disponible
- **HighMemoryUsage**: Alerta cuando el uso de memoria supera el 80%

### Configurar notificaciones

Para configurar canales de notificación (Slack, PagerDuty, email), edita el ConfigMap de Prometheus:

```bash
kubectl edit configmap prometheus-server -n monitoring
```

## Mantenimiento

### Actualizar microservicios

1. Realiza los cambios en el código del microservicio
2. Commit y push al repositorio
3. ArgoCD detectará los cambios y sincronizará automáticamente

### Escalar manualmente

```bash
kubectl scale deployment auth-service --replicas=5 -n microservices
```

### Ver logs

```bash
kubectl logs -f deployment/auth-service -n microservices
```

### Acceso a contenedores

```bash
kubectl exec -it <pod-name> -n microservices -- /bin/sh
```

## Limpieza

Para destruir todos los recursos:

```bash
terraform destroy
```

**Advertencia**: Este comando eliminará todos los recursos creados, incluyendo los datos de Prometheus y Grafana.

## Estructura del Repositorio

```
.
├── main.tf                 # Configuración principal de Terraform
├── providers.tf            # Configuración de providers
├── variables.tf            # Variables de Terraform
├── outputs.tf              # Outputs de Terraform
├── README.md               # Este archivo
├── k8s/
│   ├── argocd/             # Manifiestos de ArgoCD
│   ├── manifests/          # Manifiestos base (namespaces)
│   ├── helm/               # Valores de Helm
│   ├── monitoring/         # Configuración de Prometheus y Grafana
│   └── microservices/      # Manifiestos de microservicios
└── terraform/
    └── backend.hcl         # Configuración del backend de Terraform
```

## Troubleshooting

### El pod no inicia

```bash
kubectl describe pod <pod-name> -n microservices
kubectl logs <pod-name> -n microservices
```

### Problemas con ArgoCD

```bash
kubectl get events -n argocd --sort-by='.lastTimestamp'
```

### Verificar métricas de Prometheus

```bash
kubectl exec -it prometheus-0 -n monitoring -- /bin/promtool check config /etc/prometheus/prometheus.yml
```

## Referencias

- [Documentación de Amazon EKS](https://docs.aws.amazon.com/eks/)
- [Documentación de ArgoCD](https://argo-cd.readthedocs.io/)
- [Documentación de Prometheus](https://prometheus.io/docs/)
- [Documentación de Grafana](https://grafana.com/docs/)
- [Documentación de Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)


// === ARCHIVO: k8s/manifests/namespace.yaml ===
apiVersion: v1
kind: Namespace
metadata:
  name: microservices
  labels:
    environment: production
    tier: backend
---
apiVersion: v1
kind: Namespace
metadata:
  name: monitoring
  labels:
    environment: production
    tier: monitoring
---
apiVersion: v1
kind: Namespace
metadata:
  name: argocd
  labels:
    environment: production
    tier: ci-cd
// === ARCHIVO: k8s/helm/values.yaml ===
# Configuración global para todos los microservicios
# values.yaml - Helm chart values for microservices platform

global:
  environment: production
  replicas: 3
  
  image:
    pullPolicy: IfNotPresent
    
  resources:
    limits:
      cpu: "1000m"
      memory: "512Mi"
    requests:
      cpu: "250m"
      memory: "256Mi"
      
# Configuración de autoscaling
autoscaling:
  enabled: true
  minReplicas: 2
  maxReplicas: 10
  targetCPUUtilizationPercentage: 70
  targetMemoryUtilizationPercentage: 80

# Configuración de Ingress
ingress:
  enabled: true
  className: nginx
  annotations:
    nginx.ingress.kubernetes.io/rate-limit: "100"
    nginx.ingress.kubernetes.io/proxy-body-size: "10m"
  hosts:
    - host: api.example.com
      paths:
        - path: /auth
          pathType: Prefix
          service: auth-service
        - path: /users
          pathType: Prefix
          service: user-service
        - path: /transactions
          pathType: Prefix
          service: transaction-service

# Configuración de serviciosMicroservices:
  auth-service:
    name: auth-service
    image: auth-service:latest
    port: 8080
    
  user-service:
    name: user-service
    image: user-service:latest
    port: 8081
    
  transaction-service:
    name: transaction-service
    image: transaction-service:latest
    port: 8082

# Configuración de monitoreo
monitoring:
  prometheus:
    enabled: true
    scrapeInterval: 15s
  grafana:
    enabled: true
    adminPassword: admin

# Configuración de ArgoCD
argocd:
  enabled: true
  autoSync: true
  syncPolicy: automated
  prune: true
  selfHeal: true
// === ARCHIVO: k8s/argocd/argocd-cm.yaml ===
apiVersion: v1
kind: ConfigMap
metadata:
  name: argocd-cm
  namespace: argocd
  labels:
    app.kubernetes.io/name: argocd-cm
    app.kubernetes.io/part-of: argocd
data:
  # Configuración de repositorios
  # TODO: Agregar URL del repositorio Git
  # repositories: |
  #   - url: https://github.com/organization/repo.git
  
  # Configuración de aplicaciones
  # application.instanceLabelKey: argocd.argoproj.io/instance
  
  # Políticas de sincronización
  # resource.customizations: |
  #   argoproj.io/Application:
  #     health.lua: |
  #       hs = {
  #         status = "Progressing",
  #         message = "",
  #         healthStatus = {
  #           status = "Healthy",
  #           message = "Application is healthy"
  #         }
  #       }
  #       if obj.status ~= nil then
  #         if obj.status.health ~= nil then
  #           hs.status = obj.status.health.status
  #           hs.message = obj.status.health.message
  #           if obj.status.health.status == "Healthy" then
  #             hs.healthStatus.status = "Healthy"
  #           else
  #             hs.healthStatus.status = "Progressing"
  #           end
  #         end
  #       end
  #       return hs
  
  # Configuración de notificaciones
  # notifications.enabled: "true"
  
  # Configuración de TLS
  # tls.ca: |
  #   -----BEGIN CERTIFICATE-----
  #   ...
  #   -----END CERTIFICATE-----


// === ARCHIVO: k8s/monitoring/prometheus/prometheus-config.yaml ===
# Configuración de Prometheus para recolectar métricas de los microservicios
# Superficie de práctica - stub que el estudiante debe completar
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: prometheus-config
  namespace: monitoring
  labels:
    app: prometheus
    component: configuration
data:
  prometheus.yml: |
    global:
      scrape_interval: 15s
      evaluation_interval: 15s
      external_labels:
        cluster: 'fintech-production'
        environment: 'production'

    # Configuración de scrape targets
    # TODO: Agregar scrape configs para los microservicios:
    # - auth-service: puerto 8080, path /actuator/prometheus
    # - user-service: puerto 8080, path /actuator/prometheus
    # - transaction-service: puerto 8080, path /actuator/prometheus
    scrape_configs:
      - job_name: 'prometheus'
        static_configs:
          - targets: ['localhost:9090']

      # Stub: Agregar jobs para cada microservicio
      # Considerar:
      # - scheme: http
      # - metrics_path: /actuator/prometheus
      # - dns o service name de Kubernetes

    # Configuración de reglas de alerta
    # TODO: Definir reglas de alerta para:
    # - Alta latencia (> 500ms)
    # - Alta tasa de errores (> 1%)
    # - Caída de servicio (endpoint no disponible)
    # - Uso alto de CPU (> 80%)
    # - Uso alto de memoria (> 80%)

    rule_files:
      - '/etc/prometheus/rules/*.yml'

    # Configuración de alertas con Alertmanager
    alerting:
      alertmanagers:
        - static_configs:
            - targets: ['alertmanager:9093']

---
apiVersion: v1
kind: ConfigMap
metadata:
  name: prometheus-alerts
  namespace: monitoring
  labels:
    app: prometheus
    component: alerting
data:
  # Stub: Archivo de reglas de alerta
  # TODO: Implementar reglas de alerta reales
  alerts.yml: |-
    groups:
      - name: microservice-alerts
        rules:
          # Stub: Alerta de servicio caído
          # TODO: Implementar expresión PromQL

          # Stub: Alerta de alta latencia
          # TODO: Implementar expresión PromQL

          # Stub: Alerta de alta tasa de errores
          # TODO: Implementar expresión PromQL
// === ARCHIVO: k8s/monitoring/prometheus/prometheus-deployment.yaml ===
# Despliegue de Prometheus en el cluster Kubernetes
# Superficie de práctica - stub que el estudiante debe completar
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: prometheus
  namespace: monitoring
  labels:
    app: prometheus
    component: monitoring
spec:
  replicas: 1
  selector:
    matchLabels:
      app: prometheus
  template:
    metadata:
      labels:
        app: prometheus
    spec:
      serviceAccountName: prometheus
      containers:
        - name: prometheus
          image: prom/prometheus:v2.47.0
          args:
            - '--config.file=/etc/prometheus/prometheus.yml'
            - '--storage.tsdb.path=/prometheus'
            - '--storage.tsdb.retention.time=15d'
            - '--web.console.libraries=/etc/prometheus/console_libraries'
            - '--web.console.templates=/etc/prometheus/consoles'
            - '--web.enable-lifecycle'
          ports:
            - containerPort: 9090
              name: http
          resources:
            requests:
              cpu: 500m
              memory: 1Gi
            limits:
              cpu: 2
              memory: 2Gi
          volumeMounts:
            - name: config
              mountPath: /etc/prometheus
              readOnly: true
            - name: rules
              mountPath: /etc/prometheus/rules
              readOnly: true
            - name: data
              mountPath: /prometheus
      volumes:
        - name: config
          configMap:
            name: prometheus-config
        - name: rules
          configMap:
            name: prometheus-alerts
        - name: data
          emptyDir: {}

---
apiVersion: v1
kind: Service
metadata:
  name: prometheus
  namespace: monitoring
  labels:
    app: prometheus
spec:
  type: ClusterIP
  ports:
    - port: 9090
      targetPort: 9090
      protocol: TCP
      name: http
  selector:
    app: prometheus

---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: prometheus
  namespace: monitoring

---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: prometheus
rules:
  - apiGroups: ['']
    resources:
      - nodes
      - nodes/metrics
      - services
      - endpoints
      - pods
    verbs:
      - get
      - list
      - watch
  - apiGroups:
      - networking.k8s.io
    resources:
      - ingresses
    verbs:
      - get
      - list
      - watch
  - nonResourceURLs:
      - /metrics
    verbs:
      - get

---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: prometheus
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: prometheus
subjects:
  - kind: ServiceAccount
    name: prometheus
    namespace: monitoring
// === ARCHIVO: k8s/monitoring/grafana/grafana-dashboard.yaml ===
# Dashboard de Grafana para visualizar métricas de los microservicios
# Superficie de práctica - stub que el estudiante debe completar
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: grafana-dashboards
  namespace: monitoring
  labels:
    app: grafana
    component: dashboards
data:
  # Dashboard principal de microservicios
  microservices-dashboard.json: |-
    {
      "annotations": {
        "list": []
      },
      "editable": true,
      "fiscalYearStartMonth": 0,
      "graphTooltip": 1,
      "id": null,
      "links": [],
      "liveNow": false,
      "panels": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${datasource}"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "palette-classic"
              },
              "custom": {
                "axisCenteredZero": false,
                "axisColorMode": "text",
                "axisLabel": "",
                "axisPlacement": "auto",
                "barAlignment": 0,
                "drawStyle": "line",
                "fillOpacity": 10,
                "gradientMode": "none",
                "hideFrom": {
                  "tooltip": false,
                  "viz": false,
                  "legend": false
                },
                "lineInterpolation": "linear",
                "lineWidth": 1,
                "pointSize": 5,
                "scaleDistribution": {
                  "type": "linear"
                },
                "showPoints": "never",
                "spanNulls": false,
                "stacking": {
                  "group": "A",
                  "mode": "none"
                },
                "thresholdsStyle": {
                  "mode": "off"
                }
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  }
                ]
              },
              "unit": "s"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 0,
            "y": 0
          },
          "id": 1,
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom",
              "showLegend": true
            },
            "tooltip": {
              "mode": "multi",
              "sort": "none"
            }
          },
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${datasource}"
              },
              "expr": "histogram_quantile(0.99, rate(http_server_requests_seconds_bucket{service=\"$service\"}[5m]))",
              "legendFormat": "P99 - {{service}}",
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${datasource}"
              },
              "expr": "histogram_quantile(0.95, rate(http_server_requests_seconds_bucket{service=\"$service\"}[5m]))",
              "legendFormat": "P95 - {{service}}",
              "refId": "B"
            }
          ],
          "title": "Latencia de P95 y P99",
          "type": "timeseries"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${datasource}"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "yellow",
                    "value": 0.01
                  },
                  {
                    "color": "red",
                    "value": 0.05
                  }
                ]
              },
              "unit": "percentunit"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 12,
            "y": 0
          },
          "id": 2,
          "options": {
            "orientation": "auto",
            "reduceOptions": {
              "values": false,
              "calcs": [
                "lastNotNull"
              ],
              "fields": ""
            },
            "showThresholdLabels": false,
            "showThresholdMarkers": true
          },
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${datasource}"
              },
              "expr": "sum(rate(http_server_requests_seconds_count{status=~\"5..\",service=\"$service\"}[5m])) / sum(rate(http_server_requests_seconds_count{service=\"$service\"}[5m]))",
              "refId": "A"
            }
          ],
          "title": "Tasa de errores (5xx)",
          "type": "gauge"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${datasource}"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "palette-classic"
              },
              "custom": {
                "axisCenteredZero": false,
                "axisColorMode": "text",
                "axisLabel": "",
                "axisPlacement": "auto",
                "barAlignment": 0,
                "drawStyle": "line",
                "fillOpacity": 10,
                "gradientMode": "none",
                "hideFrom": {
                  "tooltip": false,
                  "viz": false,
                  "legend": false
                },
                "lineInterpolation": "linear",
                "lineWidth": 1,
                "pointSize": 5,
                "scaleDistribution": {
                  "type": "linear"
                },
                "showPoints": "never",
                "spanNulls": false,
                "stacking": {
                  "group": "A",
                  "mode": "none"
                },
                "thresholdsStyle": {
                  "mode": "off"
                }
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  }
                ]
              },
              "unit": "reqps"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 0,
            "y": 8
          },
          "id": 3,
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom",
              "showLegend": true
            },
            "tooltip": {
              "mode": "multi",
              "sort": "none"
            }
          },
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${datasource}"
              },
              "expr": "sum(rate(http_server_requests_seconds_count{service=\"$service\"}[5m])) by (service)",
              "legendFormat": "{{service}}",
              "refId": "A"
            }
          ],
          "title": "Throughput (req/s)",
          "type": "timeseries"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${datasource}"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "palette-classic"
              },
              "custom": {
                "axisCenteredZero": false,
                "axisColorMode": "text",
                "axisLabel": "",
                "axisPlacement": "auto",
                "barAlignment": 0,
                "drawStyle": "line",
                "fillOpacity": 10,
                "gradientMode": "none",
                "hideFrom": {
                  "tooltip": false,
                  "viz": false,
                  "legend": false
                },
                "lineInterpolation": "linear",
                "lineWidth": 1,
                "pointSize": 5,
                "scaleDistribution": {
                  "type": "linear"
                },
                "showPoints": "never",
                "spanNulls": false,
                "stacking": {
                  "group": "A",
                  "mode": "none"
                },
                "thresholdsStyle": {
                  "mode": "off"
                }
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  }
                ]
              },
              "unit": "percent"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 12,
            "y": 8
          },
          "id": 4,
          "options": {
            "legend": {
              "calcs": [],
              "displayMode": "list",
              "placement": "bottom",
              "showLegend": true
            },
            "tooltip": {
              "mode": "multi",
              "sort": "none"
            }
          },
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${datasource}"
              },
              "expr": "(1 - (avg(container_memory_working_set_bytes{container=\"$container\"}) / avg(container_spec_memory_limit_bytes{container=\"$container\"}))) * 100",
              "legendFormat": "Memoria disponible %",
              "refId": "A"
            }
          ],
          "title": "Uso de memoria",
          "type": "timeseries"
        }
      ],
      "refresh": "30s",
      "schemaVersion": 38,
      "style": "dark",
      "tags": ["microservices", "fintech"],
      "templating": {
        "list": [
          {
            "current": {
              "selected": false,
              "text": "Prometheus",
              "value": "Prometheus"
            },
            "hide": 0,
            "includeAll": false,
            "label": "Datasource",
            "multi": false,
            "name": "datasource",
            "options": [],
            "query": "prometheus",
            "refresh": 1,
            "regex": "",
            "skipUrlSync": false,
            "type": "datasource"
          },
          {
            "current": {
              "selected": false,
              "text": "All",
              "value": "$__all"
            },
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "definition": "label_values(http_server_requests_seconds_count, service)",
            "hide": 0,
            "includeAll": true,
            "label": "Service",
            "multi": true,
            "name": "service",
            "options": [],
            "query": {
              "query": "label_values(http_server_requests_seconds_count, service)",
              "refId": "StandardVariableQuery"
            },
            "refresh": 1,
            "regex": "",
            "skipUrlSync": false,
            "sort": 0,
            "type": "query"
          },
          {
            "current": {
              "selected": false,
              "text": "All",
              "value": "$__all"
            },
            "datasource": {
              "type": "prometheus",
              "uid": "${datasource}"
            },
            "definition": "label_values(container_memory_working_set_bytes, container)",
            "hide": 0,
            "includeAll": true,
            "label": "Container",
            "multi": true,
            "name": "container",
            "options": [],
            "query": {
              "query": "label_values(container_memory_working_set_bytes, container)",
              "refId": "StandardVariableQuery"
            },
            "refresh": 1,
            "regex": "",
            "skipUrlSync": false,
            "sort": 0,
            "type": "query"
          }
        ]
      },
      "time": {
        "from": "now-1h",
        "to": "now"
      },
      "timepicker": {},
      "timezone": "",
      "title": "Microservicios - Fintech",
      "uid": "microservices-fintech",
      "version": 1,
      "weekStart": ""
    }


// === ARCHIVO: k8s/monitoring/grafana/grafana-deployment.yaml ===
apiVersion: apps/v1
kind: Deployment
metadata:
  name: grafana
  namespace: monitoring
  labels:
    app: grafana
    component: visualization
spec:
  replicas: 1
  selector:
    matchLabels:
      app: grafana
  template:
    metadata:
      labels:
        app: grafana
    spec:
      containers:
        - name: grafana
          image: grafana/grafana:10.2.0
          ports:
            - containerPort: 3000
              name: http
              protocol: TCP
          env:
            - name: GF_SECURITY_ADMIN_USER
              valueFrom:
                secretKeyRef:
                  name: grafana-credentials
                  key: admin-user
                  optional: true
            - name: GF_SECURITY_ADMIN_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: grafana-credentials
                  key: admin-password
                  optional: true
          resources:
            requests:
              cpu: 100m
              memory: 128Mi
            limits:
              cpu: 500m
              memory: 512Mi
          volumeMounts:
            - name: grafana-storage
              mountPath: /var/lib/grafana
            - name: grafana-dashboards
              mountPath: /etc/grafana/provisioning/dashboards
              readOnly: true
            - name: grafana-datasources
              mountPath: /etc/grafana/provisioning/datasources
              readOnly: true
      volumes:
        - name: grafana-storage
          emptyDir: {}
        - name: grafana-dashboards
          configMap:
            name: grafana-dashboards
        - name: grafana-datasources
          configMap:
            name: grafana-datasources
---
apiVersion: v1
kind: Service
metadata:
  name: grafana
  namespace: monitoring
  labels:
    app: grafana
spec:
  type: ClusterIP
  ports:
    - port: 3000
      targetPort: 3000
      protocol: TCP
      name: http
  selector:
    app: grafana
// === ARCHIVO: k8s/microservices/auth-service/deployment.yaml ===
apiVersion: apps/v1
kind: Deployment
metadata:
  name: auth-service
  namespace: microservices
  labels:
    app: auth-service
    tier: backend
    version: v1
spec:
  replicas: 3
  selector:
    matchLabels:
      app: auth-service
  template:
    metadata:
      labels:
        app: auth-service
        tier: backend
        version: v1
    spec:
      containers:
        - name: auth-service
          image: auth-service:latest
          imagePullPolicy: IfNotPresent
          ports:
            - containerPort: 8080
              name: http
              protocol: TCP
          env:
            - name: SPRING_PROFILES_ACTIVE
              value: "prod"
            - name: JWT_SECRET
              valueFrom:
                secretKeyRef:
                  name: auth-secrets
                  key: jwt-secret
            - name: DATABASE_URL
              valueFrom:
                configMapKeyRef:
                  name: auth-config
                  key: database.url
          resources:
            requests:
              cpu: 200m
              memory: 512Mi
            limits:
              cpu: 1000m
              memory: 1Gi
          livenessProbe:
            httpGet:
              path: /actuator/health/liveness
              port: 8080
            initialDelaySeconds: 60
            periodSeconds: 10
            timeoutSeconds: 5
            failureThreshold: 3
          readinessProbe:
            httpGet:
              path: /actuator/health/readiness
              port: 8080
            initialDelaySeconds: 30
            periodSeconds: 5
            timeoutSeconds: 3
            failureThreshold: 2
      affinity:
        podAntiAffinity:
          preferredDuringSchedulingIgnoredDuringExecution:
            - weight: 100
              podAffinityTerm:
                labelSelector:
                  matchLabels:
                    app: auth-service
                topologyKey: kubernetes.io/hostname
// === ARCHIVO: k8s/microservices/auth-service/service.yaml ===
apiVersion: v1
kind: Service
metadata:
  name: auth-service
  namespace: microservices
  labels:
    app: auth-service
    tier: backend
spec:
  type: ClusterIP
  ports:
    - port: 80
      targetPort: 8080
      protocol: TCP
      name: http
  selector:
    app: auth-service
---
apiVersion: v1
kind: Service
metadata:
  name: auth-service-headless
  namespace: microservices
  labels:
    app: auth-service
    tier: backend
spec:
  clusterIP: None
  ports:
    - port: 8080
      targetPort: 8080
      protocol: TCP
      name: http
  selector:
    app: auth-service


// === ARCHIVO: k8s/microservices/auth-service/hpa.yaml ===
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: auth-service-hpa
  namespace: microservices
  labels:
    app: auth-service
    tier: backend
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: auth-service
  minReplicas: 2
  maxReplicas: 10
  metrics:
    - type: Resource
      resource:
        name: cpu
        target:
          type: Utilization
          averageUtilization: 70
    - type: Resource
      resource:
        name: memory
        target:
          type: Utilization
          averageUtilization: 80
  behavior:
    scaleDown:
      stabilizationWindowSeconds: 300
      policies:
        - type: Percent
          value: 10
          periodSeconds: 60
    scaleUp:
      stabilizationWindowSeconds: 0
      policies:
        - type: Percent
          value: 100
          periodSeconds: 15
        - type: Pods
          value: 4
          periodSeconds: 15
      selectPolicy: Max
// === ARCHIVO: k8s/microservices/user-service/deployment.yaml ===
apiVersion: apps/v1
kind: Deployment
metadata:
  name: user-service
  namespace: microservices
  labels:
    app: user-service
    version: v1
    tier: backend
spec:
  replicas: 3
  selector:
    matchLabels:
      app: user-service
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 0
  template:
    metadata:
      labels:
        app: user-service
        version: v1
        tier: backend
      annotations:
        prometheus.io/scrape: "true"
        prometheus.io/port: "8080"
        prometheus.io/path: "/metrics"
    spec:
      serviceAccountName: microservices-sa
      securityContext:
        runAsNonRoot: true
        runAsUser: 1000
        fsGroup: 1000
      containers:
        - name: user-service
          image: user-service:latest
          imagePullPolicy: IfNotPresent
          ports:
            - name: http
              containerPort: 8080
              protocol: TCP
          env:
            - name: SPRING_PROFILES_ACTIVE
              value: "prod"
            - name: DATABASE_HOST
              valueFrom:
                configMapKeyRef:
                  name: user-service-config
                  key: database.host
            - name: DATABASE_PORT
              valueFrom:
                configMapKeyRef:
                  name: user-service-config
                  key: database.port
          resources:
            requests:
              cpu: "250m"
              memory: "512Mi"
            limits:
              cpu: "1000m"
              memory: "1Gi"
          livenessProbe:
            httpGet:
              path: /actuator/health/liveness
              port: http
            initialDelaySeconds: 60
            periodSeconds: 10
            timeoutSeconds: 5
            failureThreshold: 3
          readinessProbe:
            httpGet:
              path: /actuator/health/readiness
              port: http
            initialDelaySeconds: 30
            periodSeconds: 5
            timeoutSeconds: 3
            failureThreshold: 3
          startupProbe:
            httpGet:
              path: /actuator/health
              port: http
            initialDelaySeconds: 10
            periodSeconds: 5
            timeoutSeconds: 3
            failureThreshold: 30
// === ARCHIVO: k8s/microservices/user-service/service.yaml ===
apiVersion: v1
kind: Service
metadata:
  name: user-service
  namespace: microservices
  labels:
    app: user-service
    tier: backend
  annotations:
    description: "Servicio de gestión de usuarios"
spec:
  type: ClusterIP
  selector:
    app: user-service
  ports:
    - name: http
      port: 80
      targetPort: http
      protocol: TCP
  sessionAffinity: None
  publishNotReadyAddresses: false


// === ARCHIVO: k8s/microservices/transaction-service/deployment.yaml ===
apiVersion: apps/v1
kind: Deployment
metadata:
  name: transaction-service
  namespace: microservices
  labels:
    app: transaction-service
    tier: backend
spec:
  replicas: 3
  selector:
    matchLabels:
      app: transaction-service
  template:
    metadata:
      labels:
        app: transaction-service
        tier: backend
    spec:
      containers:
      - name: transaction-service
        image: transaction-service:latest
        ports:
        - containerPort: 8080
          name: http
        envFrom:
        - configMapRef:
            name: transaction-service-config
        resources:
          requests:
            memory: "256Mi"
            cpu: "200m"
          limits:
            memory: "512Mi"
            cpu: "500m"
        livenessProbe:
          httpGet:
            path: /health
            port: 8080
          initialDelaySeconds: 30
          periodSeconds: 10
        readinessProbe:
          httpGet:
            path: /ready
            port: 8080
          initialDelaySeconds: 5
          periodSeconds: 5
---
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: transaction-service-hpa
  namespace: microservices
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: transaction-service
  minReplicas: 3
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 70
// === ARCHIVO: k8s/microservices/transaction-service/service.yaml ===
apiVersion: v1
kind: Service
metadata:
  name: transaction-service
  namespace: microservices
  labels:
    app: transaction-service
spec:
  type: ClusterIP
  ports:
  - port: 80
    targetPort: 8080
    protocol: TCP
    name: http
  selector:
    app: transaction-service
---
apiVersion: v1
kind: Service
metadata:
  name: transaction-service-external
  namespace: microservices
  labels:
    app: transaction-service
spec:
  type: NodePort
  ports:
  - port: 8080
    targetPort: 8080
    nodePort: 30080
    protocol: TCP
    name: http
  selector:
    app: transaction-service
// === ARCHIVO: k8s/microservices/transaction-service/configmap.yaml ===
apiVersion: v1
kind: ConfigMap
metadata:
  name: transaction-service-config
  namespace: microservices
data:
  SPRING_PROFILES_ACTIVE: "production"
  TRANSACTION_SERVICE_PORT: "8080"
  DATABASE_HOST: "postgres.microservices.svc.cluster.local"
  DATABASE_PORT: "5432"
  AUTH_SERVICE_URL: "http://auth-service.microservices.svc.cluster.local"
  USER_SERVICE_URL: "http://user-service.microservices.svc.cluster.local"
  TRANSACTION_TIMEOUT_MS: "5000"
  MAX_TRANSACTION_AMOUNT: "100000"
  LOG_LEVEL: "INFO"

```
