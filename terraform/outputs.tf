output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks_service.cluster_name
}

output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks_service.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ID attached to the EKS cluster"
  value       = module.eks_service.cluster_security_group_id
}

output "vpc_id" {
  description = "VPC ID where EKS cluster is deployed"
  value       = module.eks_service.vpc_id
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.eks_service.private_subnet_ids
}

output "kubeconfig_command" {
  description = "Command to update kubeconfig"
  value       = "aws eks update-kubeconfig --region ${var.aws_region} --name ${module.eks_service.cluster_name}"
}