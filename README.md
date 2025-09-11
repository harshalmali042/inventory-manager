# Inventory-Manager Application Deployment on AWS EKS

This project demonstrates the end-to-end deployment of a cloud-native web application on **Amazon EKS (Elastic Kubernetes Service)** using **Terraform, Docker, Kubernetes, and Jenkins**.  
It covers Infrastructure as Code (IaC), containerization, orchestration, and CI/CD automation.

---

## 📂 Project Structure
```

.
├── app/                  # Application source code & templates
│   ├── templates/        # HTML templates (add, edit, index, layout)
│   ├── main.py           # Flask / FastAPI / Python application entry point
│   ├── requirements.txt  # Python dependencies
│
├── k8s/                  # Kubernetes manifests
│   ├── deployment.yaml   # App deployment definition
│   ├── service.yaml      # Service for app exposure
│
├── terraform/            # Infrastructure as Code (AWS EKS + VPC)
│   ├── eks.tf
│   ├── vpc.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── versions.tf
│
├── Dockerfile            # Containerization of application
├── Jenkinsfile           # Jenkins CI/CD pipeline
├── jenkins-install.sh    # Script to set up Jenkins server

````

---

## 🏗️ Architecture Overview
- **Application:** Python (Flask/FastAPI) with HTML templates  
- **Containerization:** Docker  
- **Orchestration:** Kubernetes on AWS EKS  
- **Infrastructure as Code:** Terraform (EKS, VPC, networking)  
- **CI/CD:** Jenkins pipeline for build, test, and deploy  
- **Load Balancing & Scaling:** Managed by Kubernetes & AWS ALB  

---

## 🚀 Deployment Workflow
1. **Infrastructure Provisioning (Terraform)**
   - Creates AWS VPC, subnets, security groups
   - Provisions an Amazon EKS cluster
   - Manages outputs for `kubectl` configuration

2. **Application Containerization (Docker)**
   - Build Docker image from `Dockerfile`
   - Push image to container registry (e.g., ECR/DockerHub)

3. **Kubernetes Deployment**
   - Apply `deployment.yaml` and `service.yaml`
   - Kubernetes schedules pods in EKS cluster
   - Service exposes the application via LoadBalancer/NodePort

4. **CI/CD Pipeline (Jenkins)**
   - Jenkins pipeline (`Jenkinsfile`) automates build, test, and deployment
   - `jenkins-install.sh` bootstraps Jenkins environment

---

## ⚙️ How to Run

### 1. Build & Run Locally

```bash
pip install -r app/requirements.txt
python app/main.py
```

### 2. Build Docker Image

```bash
docker build -t myapp:latest .
docker run -p 5000:5000 myapp:latest
```

### 3. Deploy with Kubernetes

```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

### 4. Provision EKS with Terraform

```bash
cd terraform
terraform init
terraform apply -auto-approve
```

---

## 🛠️ Tools & Technologies

* **AWS EKS** – Managed Kubernetes Service
* **Terraform** – Infrastructure as Code
* **Kubernetes** – Container orchestration
* **Docker** – Application containerization
* **Jenkins** – CI/CD pipeline automation
* **Python (Flask/FastAPI)** – Application backend

---

## 🎯 Key Learnings

* Deploying applications with **Kubernetes on AWS EKS**
* Managing cloud infrastructure with **Terraform**
* Building and pushing **Docker images** for microservices
* Automating deployment pipelines with **Jenkins**
* Designing a complete **DevOps workflow** from code to production

