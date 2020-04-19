locals {
  eks-public-node-userdata = <<USERDATA
#!/bin/bash
set -o xtrace
/etc/eks/bootstrap.sh --apiserver-endpoint '${module.eks.cluster_endpoint}' --b64-cluster-ca '${module.eks.cluster_certificate_authority_data}' '${var.eks_cluster_name}' --kubelet-extra-args '${var.public-kublet-extra-args}'
USERDATA
}



module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 3.0"


  name = var.asg_name

  # Launch configuration
  lc_name = "emobg-gbi-${var.application}-${var.env}-${var.region_trigram}-pri-asg-lc"

  image_id          = var.image_id
  instance_type     = var.instance_type
  security_groups   = [module.node-sg.this_security_group_id, module.ssh_sg.this_security_group_id]
  target_group_arns = module.nlb.target_group_arns
  key_name          = module.key_pair_admin.this_key_pair_key_name

  ebs_block_device = [
    {
      device_name           = "/dev/xvdz"
      volume_type           = "gp2"
      volume_size           = "50"
      delete_on_termination = true
      tags                  = "Tobackup"
    },

  ]

  root_block_device = [
    {
      volume_size = "50"
      volume_type = "gp2"
    },
  ]

  # Auto scaling group
  asg_name                  = "${var.prefix}-gbi-${var.application}-${var.env}-${var.region_trigram}-pri-front-sub-asg"
  vpc_zone_identifier       = module.vpc.private_subnets
  health_check_type         = "EC2"
  min_size                  = 1
  max_size                  = 1
  desired_capacity          = 1
  wait_for_capacity_timeout = 0

  tags = [
    {
      key                 = "Env"
      value               = var.env
      propagate_at_launch = true
    },
    {
      key                 = "Name"
      value               = var.application
      propagate_at_launch = true
    },

    {
      key                 = "kubernetes.io/cluster/${var.eks_cluster_name}"
      value               = "owned"
      propagate_at_launch = true
    },

  ]

  tags_as_map = {
    AppRole   = "Scale group"
    ManagedBy = "DevopsTeamParis"
  }
}

