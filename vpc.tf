

resource "aws_eip" "nat" {
  count = 1
  vpc   = true
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.prefix}-gbi-${var.application}-${var.env}-${var.region_trigram}-vpc"
  cidr = var.vpc_cidr

  azs                 = var.azs
  public_subnets      = var.public_subnets
  private_subnets     = var.private_subnets
  external_nat_ip_ids = aws_eip.nat.*.id

  enable_nat_gateway     = true
  single_nat_gateway     = true
  enable_dns_hostnames   = true
  enable_dns_support     = true
  reuse_nat_ips          = true
  one_nat_gateway_per_az = false


  public_subnet_tags = {
    Name                                            = var.vcp_pub_sub_tags
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    "kubernetes.io/role/elb"                        = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"               = "1"
  }

  database_subnet_tags = {
    Name = "${var.eks_cluster_name}-eks-db"
  }

  tags = {
    Owner                                           = var.owner
    Env                                             = var.env
    Project                                         = var.application
    AppRole                                         = var.AppRole
    ManagedBy                                       = var.ManagedBy
    Name                                            = "${var.eks_cluster_name}-vpc"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
  }
}
