# AWS EC2 Security Group Terraform Module
# Security Group for Public Bastion Host

module "ansible_controller_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.1"

  name        = "Ansible-Controller-SG"
  description = "SG for Ansible controller. SSH only from admin IP"
  vpc_id      = module.a06_vpc.vpc_id
  # Ingress Rules & CIDR Blocks
  ingress_rules       = ["ssh-tcp", "all-icmp"]
  ingress_cidr_blocks = [var.admin_ip_cidr] # e.g. "203.0.113.25/32"
  # Egress Rule - all-all open
  egress_rules = ["all-all"]
  tags         = local.common_tags
}

