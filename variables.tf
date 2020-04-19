## Account ID
###Project main Configuration#####

variable "prefix" {
  default = "test"
  type    = string
}


variable "project_name" {
  description = "The projectname"
  default     = "project"
  type        = string
}

variable "application" {
  description = "The application name"
  type        = string
}


variable "AppRole" {
  description = "The application role"
  type        = string
}


variable "ManagedBy" {
  description = "The operational team oin this project"
  type        = string
}

variable "owner" {
  description = "The project Owner"
  type        = string
}

variable "env" {
  description = "The targeted environment"
  type        = string
}




variable "region_trigram" {
  description = "the region trigram example ew3 for europe west Paris"
  type        = string
  default     = ""
}

variable "project_trigramme" {
  description = "The project trigram"
  default     = "btc"
  type        = string
}

variable "account_id" {
  description = "The AWS account ID"
  type        = string
  default     = "arn:aws:iam::589079071798:role/OrganizationAccountAccessRole"
}

variable "region" {
  description = "The terageted region"
  type = string
  default = "eu-west-3"
}



# This file was generated from values defined in rules.tf using update_groups.sh.
###################################
# DO NOT CHANGE THIS FILE MANUALLY
###################################

variable "ingress_rules" {
  description = "List of ingress rules to create by name"
  type        = list(string)
  default     = []
}

variable "auto_ingress_rules" {
  description = "List of ingress rules to add automatically"
  type        = list(string)
  default     = ["http-80-tcp"]
}


variable "auto_egress_rules" {
  description = "List of egress rules to add automatically"
  type        = list(string)
  default     = ["all-all"]
}


variable "route53_parent_zone_id" {
  description = "The zone parent id"
  type        = string
  default     = "ZAMVRMOJJL6TE"
}

###ASG Variables
variable "asg_name" {
  description = "Auto scale group name"
  type        = string
  default     = "prefix-gbi-gen-dev-ew3-pri-asg"
}

variable "image_id" {
  description = "The image ID"
  type        = string
  default     = "ami-09c2081a416183927"
}

variable "instance_type" {
  description = "The instance type to deploy"
  type        = string
  default     = "t2.medium"
}

##### ROUTE 53 ###########

variable "hosted_zone_name" {
  description = "The hosted zone name"
  type        = string
  default     = "dev.application.prefix.io"
}

######### VPC Configuration ##################


variable "vpc_cidr" {
  description = "The VPC cidr block"
  type        = string
  default     = ""
}



variable "vcp_pub_sub_tags" {
  description = "The VPC tags"
  default     = ""
  type        = string
}

variable "azs" {
  description = "The availability_zones for VPC"
  type        = list
  default     = [""]
}

variable "public_subnets" {
  description = "The public CIDR list"
  type        = list
  default     = [""]
}

variable "private_subnets" {
  description = "The private sub net"
  type        = list
  default     = [""]
}



variable "database_subnets" {
  description = "The private sub net"
  type        = list
  default     = [""]
}


variable "redshift_subnets" {
  description = "The redshift subnet"
  type        = list
  default     = [""]
}

###################Security Group #################

variable "ssh_sg_name" {
  description = "The ssh security group"
  default     = "prefix-gbi-application-dev-ew3-ssh-sg"
  type        = string
}

variable "http_sg_name" {
  description = "The http security group"
  default     = "prefix-gbi-application-dev-ew3-http-sg"
  type        = string
}



#######################Auto scale group #################
variable "autoscaling_group_name" {
  description = "The auto scaling group"
  default     = "prefix-gbi-application-env-ew3-pri-front-sub-asg"
  type        = string
}

variable "launch_configuration_name" {
  description = "The launch configuration name"
  default     = "prefix-gbi-application-dev-ew3-pri-asg-lc"
  type        = string
}


#######################Bucket configuration #####################

variable "s3_app_name" {
  description = "The application bucket name "
  default     = "prefix-gba-application-dev-app-s3"
  type        = string
}

variable "s3_inf_name" {
  description = "The application bucket name "
  default     = "prefix-gba-application-dev-inf-s3"
  type        = string
}

###################### NLB Configuration  #####################################


variable "nlb_name" {
  description = "The NLB name"
  default     = "btc-sdx-ew3-pub-nlb"
  type        = string
}


##################### ALB Conficguration ##########################

variable "alb_name" {
  description = "The ALB name"
  default     = "alb-name"
  type        = string
}






###################KEY Pair ########################
variable "key_pair_admin" {
  default = "ssh-rsa RzLAgI1qVfuwyHKC6ig5uTSEu76qNE5g0A6dXZvGm13UoxfkAc2kmy83TC0s3Fs+pvsyFcVIcYiW4f8RgQUgRe1M2pkh+K361kfwtsO3nmBIEeLAGxDKhj4Ku1v7B88+HvNJvoNbxRBuUcAt11zS2PHCfE0oAlPVVNzShf2Gmuu5lxC4rrX9nVPze00LSxdd5KcFZ+8lLdc7lnuwfxDwoBeCvjZLR2MKgH82TAGJdAFmchMKu0WyElOy4oLt5uClBSqXSqKiK66E83iDKoTXmaclucYFdEyVAbO9LTP8E3P1Ka95olaEiJMA9JUk+T8Ehmjnubn5Jp91oSmdWvR+m8/32Zj9PwIAfdPO8gqhX/0RzGbMWoxeL+qDGImtBtzzA+/3UNEYfX5M4rJYgElMfTE2lBszGcgA4h8gpCYUay4+y90Fcg3dVY7ZYuxy6XfFhSctkUCu+JP1nqjXGjcFsu6+n4xTSxUfeIwsi7jsgl6kLt2apU3blhr4JRwc4TDVFSgBwadGhLHlR5s5bqRyJN0d8baK6c+H5z5Lqvjr0+db4CTZGMux3jeQcjW+XvAxgpPsg7lBe5WklpYIDNEzYfLaRVYZSvfHUG6Qo2z6Ov8psCt0z9FLWpE/l72p5mIolQOqynbHwvw== Deployer@prefix.io"
}


variable "key_pair_name" {
  description = "The Key pair name"
  default     = "btc-sdx-acces-key"
  type        = string
}


####################EKS CONFIGURATION##########################



variable "eks-cw-logging" {
  description = "The type of logging"
  type = list

}

variable "eks_cluster_name" {
  description = "The eks auto scaling grou name"
  default =  "btc-eks-dev-ew3"
  type = string
}



variable "map_accounts" {
  description = "Additional AWS account numbers to add to the aws-auth configmap."
  type        = list(string)

  default = [
    "936645143561",
    "717039430256",
  ]
}

variable "map_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap."
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))

  default = [
    {
      rolearn  = "arn:aws:iam::936645143561:role/OrganizationAccountAccessRole"
      username = "admin"
      groups   = ["system:masters"]
    },
  ]
}

variable "map_users" {
  description = "Additional IAM users to add to the aws-auth configmap."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))

  default = [
    {
      userarn  = "arn:aws:iam::936645143561:role/OrganizationAccountAccessRole"
      username = "CI"
      groups   = ["system:masters"]
    },
    {
      userarn  = "arn:aws:iam::936645143561:role/OrganizationAccountAccessRole"
      username = "Monitor"
      groups   = ["system:masters"]
    },
  ]
}


#############ASG########################
variable "desired-capacity" {
  default     = 2
  type        = string
  description = "Autoscaling Desired node capacity"
}

variable "max-size" {
  default     = 5
  type        = string
  description = "Autoscaling maximum node capacity"
}

variable "min-size" {
  default     = 1
  type        = string
  description = "Autoscaling Minimum node capacity"
}



variable "public-kublet-extra-args" {
  default     = ""
  type        = string
  description = "Additional arguments to supply to the public node kubelet process"

}


variable "local_profile" {
  description = "The local profile"
  type = string
}