## Environment Setup

### Objective
Prepare a local Kubernetes environment for Production Lab.

### Completed

- Installed Docker
- Configured Docker permissions for ec2-user
- Learned Image vs Container
- Ran first Docker container (Nginx)
- Used docker ps, logs, exec, inspect
- Installed kubectl
- Installed Minikube
- Created Kubernetes cluster using Docker driver
- Verified cluster connectivity

### Key Learning

Linux
→ manages processes

Docker
→ manages containers

Kubernetes
→ manages Pods (which contain containers)

### Next

Deploy first application using Kubernetes Deployment.

---

# Kubernetes Workloads

## Objective

Deploy and manage applications on Kubernetes using production-style manifests and operational troubleshooting.

---

## Architecture

Python Application
↓
Docker Image
↓
Minikube Image
↓
Deployment
↓
ReplicaSet
↓
Pod
↓
Service (NodePort)

---

## Concepts Covered

### Kubernetes Objects

- Node
- Pod
- Deployment
- ReplicaSet
- Service (NodePort)
- ConfigMap

### Operations

- Scaling Deployments
- Self-healing
- Rolling Updates
- Rollbacks
- Declarative Manifests

---

## Hands-on Activities

### Nginx Application

- Created first Deployment
- Created NodePort Service
- Accessed application through Minikube
- Observed Deployment → ReplicaSet → Pod relationship

### Pod Self-Healing

Deleted a running Pod.

Observed ReplicaSet automatically creating a replacement Pod.

### Scaling

Scaled Deployment from:

1 Pod → 3 Pods → 1 Pod

Observed Kubernetes maintaining desired state.

### Rolling Update

Updated application image.

Observed Kubernetes replacing Pods gradually without downtime.

### Rollback

Simulated a failed deployment using an invalid image.

Observed:

- ErrImagePull
- Rollout failure
- Progress deadline exceeded

Recovered using:

kubectl rollout undo

---

## Custom Python Application

Dockerized the existing Python application.

Deployment Flow:

Source Code
→ Dockerfile
→ Docker Image
→ Minikube Image
→ Deployment
→ Pod

---

## ConfigMap

Created:

app-config

Application now reads configuration using:

APP_MESSAGE

instead of hardcoded values.

---

## Production Incident

### Issue

Application continued returning:

Default Message

instead of ConfigMap value.

### Investigation

Verified sequentially:

ConfigMap
↓
Deployment
↓
Pod
↓
Environment Variables
↓
Application

Found Deployment manifest missing the required environment variable configuration.

### Resolution

Added ConfigMap reference inside Deployment manifest.

Applied changes using:

kubectl apply

Verified:

- Environment variable injected
- Pod recreated successfully
- Application returned ConfigMap value

---

## Key Learnings

Linux
→ manages processes

Docker
→ manages containers

Kubernetes
→ manages Pods

Deployment
→ manages ReplicaSets

ReplicaSet
→ maintains desired number of Pods

Service
→ provides a stable endpoint to Pods

ConfigMap
→ separates configuration from application code

---

## Repository Structure

production-lab/

kubernetes/

- deployments/
- services/
- configmaps/
- ingress/
- namespaces/
- secrets/
- storage/

---

## Current Status

Completed

- Docker Fundamentals
- Kubernetes Cluster
- Deployments
- ReplicaSets
- Pods
- Services
- Self-healing
- Scaling
- Rolling Updates
- Rollbacks
- Dockerized Python Application
- ConfigMaps
- Declarative Deployment Manifest

Next

- Secrets
- Ingress
- Monitoring Integration
- Terraform

---

# Secrets

## Objective

Separate sensitive configuration from application code.

---

## Secret Created

app-secret

Keys:

- DB_USERNAME
- DB_PASSWORD

---

## Deployment Update

Injected Secret into the application using:

secretKeyRef

Environment Variables:

- DB_USERNAME
- DB_PASSWORD

---

## Verification

Verified inside the running Pod:

kubectl exec

Confirmed:

- Secret values available inside container
- Application configuration separated into:
  - ConfigMap (non-sensitive)
  - Secret (sensitive)

---

## Key Learning

ConfigMap

→ Non-sensitive configuration

Examples:

- Log Level
- Hostname
- Feature Flags

Secret

→ Sensitive configuration

Examples:

- Passwords
- API Keys
- Tokens

---

## Interview Takeaway

Secrets are Base64 encoded by default.

They are not encrypted unless encryption at rest is enabled.

Use Secrets because Kubernetes treats sensitive data differently from normal configuration.

---

# Ingress

## Objective

Provide a single entry point for applications running inside Kubernetes.

---

## Why Ingress

Without Ingress:

Python App
→ NodePort 30267

Grafana
→ NodePort 31000

Prometheus
→ NodePort 30900

Multiple applications require multiple ports.

Ingress allows all applications to be accessed through standard HTTP/HTTPS ports while routing traffic internally.

---

## Architecture

Browser
↓
Ingress
↓
Service
↓
Pod

---

## Implementation

Enabled NGINX Ingress Controller using Minikube addon.

Created:

python-app-ingress.yaml

Configured routing:

/

↓

python-app Service

Verified application successfully through Ingress.

---

## Key Learning

Ingress is Kubernetes' reverse proxy.

Ingress does not directly communicate with Pods.

Traffic flow:

Browser
↓
Ingress
↓
Service
↓
Pod

---

## Interview Takeaway

NodePort

- One Service per port
- Suitable for testing

Ingress

- Single entry point
- Multiple applications
- Host/path based routing
- Production standard

---

# Kubernetes Monitoring

## Current Status

Enabled:

- Metrics Server

Verified:

kubectl top initially failed with:

Metrics API not available

Root Cause:

Metrics Server was not installed.

Enabled Metrics Server using Minikube addon.

Monitoring implementation continues in the next milestone.

Upcoming Topics

- kubectl top
- kube-system
- kube-state-metrics
- Prometheus integration
- Kubernetes monitoring architecture
