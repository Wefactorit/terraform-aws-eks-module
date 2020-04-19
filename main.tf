

provider "aws" {
  region = "eu-west-1"
   assume_role {
    role_arn = "arn:aws:iam::936645143561:role/OrganizationAccountAccessRole"
  }
}

/*terraform {
  backend "s3" {

    role_arn  = "arn:aws:iam::936645143561:role/OrganizationAccountAccessRole"
    encrypt = false
    bucket  = "emobg-gba-bettercar-dev-inf-s3"
    region  = "eu-west-3"
    key     = "terraform/terraform.tfstate"
  }
}*/



provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
  #version                = "~> 1.11.0"
}


provider "helm" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
  version = "~> 1.0.0"
}
