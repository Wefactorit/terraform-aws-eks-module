
project_name      = "example"
project_trigramme = "exp"
region_trigram    = "ew1"
region            = "eu-west-1"
application       = "gen"
env               = "sdx"
owner             = "Devopsteam"
AppRole           = "generic_app"
ManagedBy         = "Devopsteam"
instance_type     = "t2.medium"

####EKS########
eks-cw-logging   = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
eks_cluster_name = "test"
image_id         = "ami-0c0b45cac6250d566"

#############ASG##############
desired-capacity = 3
max-size         = 5
min-size         = 1
##VPC##
vpc_cidr         = "10.8.2.0/23"
azs              = ["eu-west-1a", "eu-west-1b"]
public_subnets   = ["10.8.2.32/27", "10.8.3.32/27"]
private_subnets  = ["10.8.2.64/27", "10.8.3.64/27"]
database_subnets = ["10.8.2.96/27", "10.8.3.96/27"]



####### KUBECTL ###############

local_profile = "r-emobg-gbi-devops-sbx-ops-admin"
