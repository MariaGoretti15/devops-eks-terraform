# Local variables for common tags and naming
locals {
  common_tags = {
    Environment = "demo"
    Project     = "devops-eks-terraform"
    ManagedBy   = "terraform"
  }
}

# Call the EKS service module
module "eks_service" {
  source = "./modules/eks-service"
  
  cluster_name         = var.cluster_name
  node_group_name      = var.node_group_name
  node_instance_types  = var.node_instance_types
  desired_capacity     = var.desired_capacity
  max_capacity         = var.max_capacity
  min_capacity         = var.min_capacity
  
  tags = local.common_tags
}