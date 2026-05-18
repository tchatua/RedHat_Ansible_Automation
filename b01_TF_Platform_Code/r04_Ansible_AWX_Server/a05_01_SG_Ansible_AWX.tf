# AWS EC2 Security Group Terraform Module
# Security Group for Public Bastion Host

module "ansible_awx_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.1"

  name        = "Ansible-AWX-SG"
  description = "SG for Ansible AWX. SSH only from admin IP"

  # vpc_id      = module.a06_vpc.vpc_id
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  # Ingress Rules & CIDR Blocks
  ingress_rules       = ["ssh-tcp", "http-80-tcp", "https-443-tcp", "all-icmp"] # To allow SSH access and ping
  ingress_cidr_blocks = [var.admin_ip_cidr]     # e.g. "203.0.113.25/32"

  # Egress Rule - all-all open
  egress_rules = ["all-all"]
  tags         = local.common_tags
}

