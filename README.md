# 🎮 Mario Mimic DevOps Pipeline

Production-grade cloud-native DevOps pipeline on Google Cloud Platform (GCP) using Terraform, Kubernetes, Helm, GitHub Actions, Prometheus, and Grafana.

---

# 🚀 Project Overview

This project demonstrates a complete end-to-end DevOps workflow for deploying a containerized frontend application to Google Kubernetes Engine (GKE) using modern DevOps and GitOps-oriented practices.

The application is a browser-based Super Mario game built with React/Vite and deployed through an automated CI/CD pipeline.

The infrastructure and deployment lifecycle are fully automated using:

- Terraform (Infrastructure as Code)
- Docker
- Kubernetes
- Helm
- GitHub Actions
- Artifact Registry
- Prometheus
- Grafana
- OIDC Workload Identity Federation

---

# 🏗️ Architecture

```text
Developer Pushes Code
          │
          ▼
GitHub Repository
          │
          ▼
GitHub Actions CI/CD Pipeline
          │
          ├── Authenticate to GCP via OIDC
          ├── Build Docker Image
          ├── Push Image to Artifact Registry
          ├── Connect to GKE Cluster
          └── Deploy via Helm
                    │
                    ▼
Google Kubernetes Engine (GKE)
          │
          ├── Deployment
          ├── Service (LoadBalancer)
          ├── Horizontal Pod Autoscaler
          └── Monitoring Stack
                    │
                    ├── Prometheus
                    └── Grafana
```

---

# ⚙️ Tech Stack

| Category | Tools |
|---|---|
| Cloud Provider | GCP |
| Infrastructure as Code | Terraform |
| Containerization | Docker |
| Container Registry | Artifact Registry |
| Orchestration | Kubernetes (GKE) |
| Package Management | Helm |
| CI/CD | GitHub Actions |
| Authentication | OIDC Workload Identity Federation |
| Monitoring | Prometheus |
| Visualization | Grafana |
| Frontend | React + Vite |
| Scaling | Kubernetes HPA |

---

# 📁 Repository Structure

```text
mario-mimic-devops-pipeline/
│
├── .github/workflows/
│   └── deploy.yml
│
├── app/
│   └── super-mario-mimic/
│       ├── Dockerfile
│       ├── package.json
│       ├── src/
│       └── ...
│
├── helm/
│   └── super-mario/
│       ├── templates/
│       │   ├── deployment.yaml
│       │   ├── service.yaml
│       │   ├── hpa.yaml
│       │   └── namespace.yaml
│       ├── Chart.yaml
│       └── values.yaml
│
├── terraform/
│   ├── modules/
│   │   ├── vpc/
│   │   ├── gke/
│   │   └── artifact-registry/
│   │
│   ├── main.tf
│   ├── provider.tf
│   ├── outputs.tf
│   └── variables.tf
│
└── README.md
```

---

# ☁️ Infrastructure Provisioned via Terraform

Terraform is used to provision:

- Custom VPC
- GKE Cluster
- Artifact Registry
- Networking resources
- Outputs and reusable modules

### Benefits

- Infrastructure as Code
- Reproducibility
- Modular architecture
- Version-controlled infrastructure

---

# 🔄 CI/CD Pipeline

GitHub Actions pipeline automatically performs:

1. Checkout repository
2. Authenticate to GCP using OIDC
3. Configure Docker authentication
4. Connect to GKE cluster
5. Build Docker image
6. Push image to Artifact Registry
7. Deploy application using Helm
8. Verify deployment status

---

# 🔐 Security Implementation

## OIDC Workload Identity Federation

Instead of storing long-lived GCP service account keys inside GitHub Secrets, this project uses:

- GitHub OIDC tokens
- Workload Identity Federation
- Short-lived credentials

### Benefits

- No JSON keys stored
- Reduced credential leakage risk
- Enterprise-grade authentication

---

# ☸️ Kubernetes Features Implemented

## Deployment

Manages:
- Replica lifecycle
- Rolling updates
- Self-healing pods

---

## Service

Exposes the application using:

- LoadBalancer service

---

## Horizontal Pod Autoscaler (HPA)

Automatically scales pods based on CPU utilization.

---

## Helm

Used for:

- Templating Kubernetes manifests
- Reusable deployments
- Versioned releases
- Rollbacks
- Parameterized configurations

---

# 📊 Monitoring Stack

## Prometheus

Used for:

- Metrics collection
- Kubernetes monitoring
- Resource visibility
- Cluster observability

---

## Grafana

Used for:

- Dashboard visualization
- Metrics analysis
- Cluster monitoring

---

# 🐳 Docker Build Strategy

Multi-stage Docker build used for optimization.

### Benefits

- Smaller final image size
- Faster deployments
- Better layer caching
- Production-ready container image

---

# 📦 Artifact Registry

Docker images are stored inside:

- Google Artifact Registry

Benefits:

- Secure image storage
- Integrated with GKE
- IAM-based access control

---

# 📈 Key DevOps Concepts Demonstrated

- Infrastructure as Code
- CI/CD Automation
- Kubernetes Deployments
- Helm-based Application Management
- GitHub Actions Pipelines
- Cloud-native Monitoring
- Containerization
- Secure Cloud Authentication
- Auto Scaling
- Observability
- Immutable Deployments

---

# 🧪 Deployment Workflow

```text
Code Push
   │
   ▼
GitHub Actions Triggered
   │
   ▼
Docker Image Build
   │
   ▼
Push Image to Artifact Registry
   │
   ▼
Helm Deployment to GKE
   │
   ▼
Kubernetes Rollout
   │
   ▼
Prometheus Metrics Collection
   │
   ▼
Grafana Dashboard Visualization
```

---

# 📸 Screenshots

## GitHub Actions Pipeline
_Add screenshot here_

---

## GKE Workloads
_Add screenshot here_

---

## Grafana Dashboard
_Add screenshot here_

---

## Prometheus Targets
_Add screenshot here_

---

# 🛠️ Future Improvements

- ArgoCD GitOps Integration
- Blue-Green Deployment
- Canary Deployment
- Loki Log Aggregation
- Trivy Image Scanning
- SonarQube Code Analysis
- Multi-Environment Deployments
- Ingress + Domain + TLS
- Cost Optimization Automation

---

# ▶️ How to Run

## Clone Repository

```bash
git clone <your-repo-url>
cd mario-mimic-devops-pipeline
```

---

## Provision Infrastructure

```bash
cd terraform

terraform init
terraform plan
terraform apply
```

---

## Deploy Application

Push code to:

```text
main branch
```

GitHub Actions automatically handles deployment.

---

# 📌 Author

Sidharth Sehrawat

---

# ⭐ Final Outcome

This project demonstrates a real-world production-style DevOps workflow using modern cloud-native tooling and best practices on Google Cloud Platform.
