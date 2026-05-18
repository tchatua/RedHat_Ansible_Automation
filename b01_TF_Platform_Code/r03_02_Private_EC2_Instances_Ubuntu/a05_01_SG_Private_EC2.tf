# AWS EC2 Security Group Terraform Module
# Security Group for Public Bastion Host

module "private_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.1"

  name        = "private-sg"
  description = "SG with HTTP & SSH ports open for entire VPC block"

  # vpc_id      = module.a06_vpc.vpc_id
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  # Ingress Rules & CIDR Blocks
  ingress_rules       = ["ssh-tcp", "http-80-tcp"]                                # To allow SSH access and ping
  ingress_cidr_blocks = [data.terraform_remote_state.vpc.outputs.vpc_cidr_blocks] # e.g. "203.0.113.25/32"

  # Egress Rule - all-all open
  egress_rules = ["all-all"]
  tags         = local.common_tags
}

