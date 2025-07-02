# DevOps Assignment: Terraform + EKS Containerized Deployment

This project demonstrates how to deploy a containerized application end-to-end on AWS EKS using Terraform. The infrastructure is provisioned as code, ensuring repeatability and scalability.

---

## 🚀 Project Overview

This project uses Terraform to provision an AWS EKS cluster and deploys a containerized application onto it. The app is packaged as a Docker container, managed with Kubernetes manifests, and deployed on the EKS cluster. This approach enables infrastructure automation, version control, and easy scaling.

### Key Design Decisions

- **Terraform for Infrastructure as Code (IaC):** To ensure consistent and repeatable infrastructure provisioning.
- **EKS for Managed Kubernetes:** Offloads cluster management to AWS, reducing operational overhead.
- **Dockerized Application:** Containerization ensures consistent app behavior across environments.
- **Separation of Concerns:** Terraform handles infrastructure, Kubernetes manifests handle app deployment, allowing flexible updates.

---

## 📋 Prerequisites

Before you start, make sure you have the following installed and configured:

- [AWS CLI](https://aws.amazon.com/cli/) configured with appropriate credentials and permissions.
- [Terraform](https://www.terraform.io/downloads.html)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Docker](https://www.docker.com/get-started)
- [Git](https://git-scm.com/)

---

## ⚙️ Step-by-Step Deployment Instructions

### 1. Clone the Repository

git clone https://github.com/your-username/your-repository.git

cd devops-eks-terraform

### 2. Initialize Terraform

Run the following command to initialize Terraform:

terraform init

### 3. Review Terraform Plan

Run the following command to review the execution plan:

terraform plan
### 4. Apply Terraform Configuration

Run the following command to apply the Terraform configuration:

terraform apply

Type `yes` to confirm. Terraform will provision:

- VPC and networking components
- EKS cluster
- IAM roles and policies
- Node groups and other required resources

### 5. Configure kubectl to Use the New Cluster

Update your kubeconfig to point to the newly created EKS cluster:

aws eks --region <aws-region> update-kubeconfig --name <cluster-name>

### 6. Deploy Kubernetes Resources

Apply the Kubernetes manifests:

kubectl apply -f k8s/

(This will deploy your application to the EKS cluster)

### 7. Verify Deployment

Check the status of your pods and services:


kubectl get pods

kubectl get services

(Ensure all pods are in the Running state)

### Accessing the Application

If your Kubernetes service is of type LoadBalancer, retrieve the external IP or DNS:

kubectl get svc

(Open the external IP or DNS in your browser to view the app.
If you used an Application Load Balancer (ALB), use the DNS name provided by the ALB)

### Clean Up Resources

To avoid AWS charges, destroy all resources when you're finished:

terraform destroy


### ✅ Access the Application

Copy the `EXTERNAL-IP` under the LoadBalancer type service, and open it in your browser.

You should see the **NGINX welcome page**.

---

### ✅ Expected Output

- The **NGINX welcome page** confirming the application is running  
- A **publicly accessible URL** served from your EKS cluster  
- **Terraform output** indicating successful resource creations

  

