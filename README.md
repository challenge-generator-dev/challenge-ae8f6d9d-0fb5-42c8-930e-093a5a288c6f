# Despliegue de una plataforma de microservicios con Kubernetes

El equipo de desarrollo de una fintech necesita desplegar una plataforma de microservicios usando Kubernetes, Helm, GitOps con ArgoCD y monitoreo con Prometheus y Grafana. La plataforma debe soportar un tráfico de 10 000 solicitudes por segundo con un SLA del 99.9%. Los microservicios incluyen un servicio de autenticación, un servicio de gestión de usuarios y un servicio de transacciones. El equipo debe asegurar que los servicios sean desplegados de manera idempotente y que el monitoreo permita detectar y alertar sobre caídas de servicios en tiempo real.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Kubernetes DevOps |
| **Nivel** | junior-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 30 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y generará un ZIP listo para usar.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Un IDE o editor de código.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y generará un archivo ZIP descargable. Descárgalo y extráelo en la carpeta donde quieras trabajar.
- Verifica que el proyecto arranca sin errores.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no genera el ZIP automáticamente al terminar el análisis, escríbele: "genera el ZIP ahora".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Configuración inicial de Kubernetes

**Objetivo:** Establecer un cluster de Kubernetes funcional y configurar Helm para gestionar los microservicios.

**Tiempo estimado:** 8 horas

**Instrucciones:**

- Configurar un cluster de Kubernetes en un entorno de pruebas.
- Instalar y configurar Helm para gestionar los microservicios.
- Verificar que el cluster esté operativo y que Helm pueda desplegar aplicaciones.

**Entregable:** Cluster de Kubernetes configurado y Helm instalado.

<details>
<summary>Pistas de conocimiento</summary>

- Investigar sobre la configuración de un cluster de Kubernetes.
- Explorar las mejores prácticas para usar Helm en un entorno de producción.

</details>

### Fase 2: Implementación de GitOps con ArgoCD

**Objetivo:** Configurar ArgoCD para gestionar el despliegue de los microservicios de manera idempotente.

**Tiempo estimado:** 10 horas

**Instrucciones:**

- Instalar y configurar ArgoCD en el cluster de Kubernetes.
- Crear un repositorio de Git para almacenar las configuraciones de los microservicios.
- Configurar ArgoCD para que sincronice automáticamente los cambios en el repositorio de Git con el cluster de Kubernetes.
- Verificar que los microservicios se despliegan de manera idempotente.

**Entregable:** ArgoCD configurado y sincronizando los microservicios desde el repositorio de Git.

<details>
<summary>Pistas de conocimiento</summary>

- Investigar sobre la implementación de GitOps con ArgoCD.
- Explorar las mejores prácticas para asegurar la idempotencia en los despliegues.

</details>

### Fase 3: Configuración de monitoreo con Prometheus y Grafana

**Objetivo:** Configurar Prometheus y Grafana para monitorear los microservicios y alertar sobre caídas de servicios en tiempo real.

**Tiempo estimado:** 12 horas

**Instrucciones:**

- Instalar y configurar Prometheus en el cluster de Kubernetes.
- Configurar Prometheus para recolectar métricas de los microservicios.
- Instalar y configurar Grafana para visualizar las métricas recolectadas por Prometheus.
- Configurar alertas en Grafana para notificar sobre caídas de servicios en tiempo real.
- Verificar que el monitoreo esté funcionando correctamente y que las alertas se disparen cuando corresponda.

**Entregable:** Prometheus y Grafana configurados para monitorear y alertar sobre los microservicios.

<details>
<summary>Pistas de conocimiento</summary>

- Investigar sobre la configuración de Prometheus y Grafana.
- Explorar las mejores prácticas para monitorear microservicios en Kubernetes.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Kubernetes y por qué se usa en el despliegue de microservicios?
- **paraQueSirve**: ¿Para qué sirve ArgoCD en el contexto de GitOps?
- **comoSeUsa**: ¿Cómo se usa Prometheus para monitorear microservicios?
- **erroresComunes**: ¿Cuáles son los errores comunes al configurar el monitoreo con Prometheus y Grafana?
- **queDecisionesImplica**: ¿Qué decisiones implica la configuración del monitoreo con Prometheus y Grafana?

## Criterios de Evaluacion

- Configuración correcta de un cluster de Kubernetes.
- Instalación y configuración de Helm para gestionar microservicios.
- Implementación de GitOps con ArgoCD para despliegues idempotentes.
- Configuración de Prometheus y Grafana para monitoreo y alertas en tiempo real.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT). Devuelve un ZIP con el proyecto. Sirve si no tenes un agente en el IDE.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
docker build -t reto:local . && terraform -chdir=terraform init -backend=false && terraform -chdir=terraform validate
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
