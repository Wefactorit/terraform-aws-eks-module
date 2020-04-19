resource "aws_eip" "this" {
  count = 1
  vpc   = true
}

module "nlb" {
  source = "terraform-aws-modules/alb/aws"
  version = "~> 5.0"

  name = var.nlb_name

  load_balancer_type = "network"

  vpc_id   = module.vpc.vpc_id
  internal = false

  //  Use `subnets` if you don't want to attach EIPs
  subnets = module.vpc.public_subnets

  // TCP_UDP, UDP, TCP
  http_tcp_listeners = [
    {
      port               = 22
      protocol           = "TCP"
      target_group_index = 0
    },

  ]

  target_groups = [
    {
      name_prefix      = var.project_trigramme
      backend_protocol = "TCP"
      backend_port     = 22
      target_type      = "instance"
    },

  ]
}
