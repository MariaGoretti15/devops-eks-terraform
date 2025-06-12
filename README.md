# devops-eks-terraform
# Hiive DevOps Take-Home Assignment

## Overview

This repository contains a complete Terraform-based solution to deploy a containerized service to an AWS Elastic Kubernetes Service (EKS) cluster. The project provisions all necessary infrastructure including:

- VPC with public and private subnets
- Internet Gateway and NAT Gateway
- Security groups
- IAM roles for EKS and worker nodes
- EKS Cluster (with managed node group)
- Kubernetes deployment of an `nginx` container
- LoadBalancer service to expose the deployment

The goal is to demonstrate infrastructure automation using Infrastructure as Code (IaC) and Kubernetes orchestration.

---

## Prerequisites

Ensure the following tools are installed and properly configured:

- [Terraform v1.4+](https://www.terraform.io/downloads.html)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- An AWS account and IAM user/role with sufficient permissions to create EKS, IAM roles, networking, etc.

---

## Deployment Instructions

> ⏱️ Estimated time to deploy: **15–25 minutes**

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/hiive-devops-assignment.git
cd hiive-devops-assignment
export AWS_REGION=us-east
Initialize Terraform
bash
Copy
Edit
terraform init
4. Apply Terraform Plan
You can use terraform.tfvars or pass values inline:

bash
Copy
Edit
terraform apply
Confirm with yes when prompted.

Terraform will provision the following:

A new VPC with subnets

EKS cluster

IAM roles and node groups

Kubernetes provider and resources

5. Update kubectl Context
Once the cluster is up, configure your kubeconfig:

bash
Copy
Edit
aws eks update-kubeconfig --region us-east-1 --name hiive-eks-cluster
6. Verify Kubernetes Deployment
bash
Copy
Edit
kubectl get nodes
kubectl get pods
kubectl get svc
You should see the nginx pod running and a LoadBalancer service with an external IP or hostname.

7. Access the Application
bash
Copy
Edit
kubectl get svc nginx-service
Copy the EXTERNAL-IP and test with:

bash
Copy
Edit
curl http://<EXTERNAL-IP>
You should see the default NGINX welcome page.

File Structure
bash
Copy
Edit
hiive-devops-assignment/
├── main.tf               # VPC, EKS, IAM, Kubernetes resources
├── variables.tf          # Input variables
├── outputs.tf            # Output values
├── versions.tf           # Terraform and provider requirements
├── kubernetes.tf         # Kubernetes provider and resources
├── terraform.tfvars      # (Optional) Input variable values
├── .gitignore
└── README.md             # This file
Design Decisions
Single Terraform Module: To simplify demonstration, all resources are declared in one module. In production, splitting into reusable modules is recommended.

NGINX App: Used a public container (nginx:latest) to keep the focus on infrastructure and deployment flow.

Networking: VPC spans 2 AZs with public/private subnets to mimic real-world cloud architecture.

Security: IAM roles follow least privilege principles. Security groups restrict traffic to required ports (e.g., 80 for HTTP).

Kubernetes Management: Kubernetes resources (Deployment & Service) are created using the Terraform Kubernetes provider for full IaC control.

Screenshots
If screenshots are required, add them to a /screenshots folder and embed like below:


Clean Up
To delete all resources and avoid ongoing charges:

bash
Copy
Edit
terraform destroy
Confirm with yes when prompted.

Optional Enhancements
If this were a production-level solution, the following improvements would be made:

Use Helm instead of raw manifests

Add autoscaling (HPA)

Use SSM Parameter Store or Secrets Manager for secrets

Enable cluster logging and monitoring (CloudWatch, Prometheus)

CI/CD pipeline integration

Contact
This project was completed as part of the Hiive DevOps Take-Home Interview.
If you have any questions or feedback, feel free to reach out.

Thanks for the opportunity!

