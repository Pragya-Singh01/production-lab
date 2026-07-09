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
