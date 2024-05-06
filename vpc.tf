data "aws_availability_zones" "available" {}

module "vpc" {
  source          = "terraform-aws-modules/vpc/aws"
  version         = "5.8.1"
  name            = "${var.namespace}-vpc"
  cidr            = "10.0.0.0/16"
  azs             = data.aws_availability_zones.available.names
  private_subnets = ["10.0.1.0/24","10.0.2.0/24"]
  public_subnets  = ["10.0.3.0/24","10.0.4.0/24"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_security_group" "worker_sg" {
  name_prefix = "worker_sg"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "worker_sg_ingress" {
  description       = "allow inbound traffic to eks"
  from_port         = 22
  protocol          = "SSH"
  to_port           = 22
  security_group_id = aws_security_group.worker_sg.id
  type              = "ingress"
  cidr_blocks = ["10.0.3.0/24","10.0.4.0/24"]
}

resource "aws_security_group_rule" "worker_sg_egress" {
  description       = "allow outbound traffic from eks"
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.worker_sg.id
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}