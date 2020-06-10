module "eks" {
  source                    = "terraform-aws-modules/eks/aws"
  cluster_name              = var.eks_cluster_name
  subnets                   = module.vpc.private_subnets
  cluster_enabled_log_types = var.eks-cw-logging

  tags = {
    Environment = var.env
    GithubRepo  = "terraform-aws-eks"
    GithubOrg   = "terraform-aws-modules"
  }

  vpc_id = module.vpc.vpc_id

  node_groups_defaults = {
    ami_type  = "AL2_x86_64"
    disk_size = 50
  }

  node_groups = {
    example = {
      desired_capacity = var.desired-capacity
      max_capacity     = var.max-size
      min_capacity     = var.min-size

      instance_type = "t3.small"
      k8s_labels = {
        Environment = var.env
        AppRole     = var.AppRole
        ManagedBy   = var.ManagedBy
      }
      additional_tags = {
        ExtraTag                                        = "example"
        "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
        "kubernetes.io/role/elb"                        = "1"
      }
    }
  }



  map_roles    = var.map_roles
  map_users    = var.map_users
  map_accounts = var.map_accounts

}
