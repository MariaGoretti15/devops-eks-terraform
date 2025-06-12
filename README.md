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


