# AWS EC2 Security Group Terraform Module
# Security Group for Public Bastion Host
/*
  Ansible Workers SG
    - SSH only from controller private IP
    - All outbound allowed (or limit to controller & internet if needed)
*/

module "ansible_worker_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.1"

  name        = "Ansible-Worker-SG"
  description = "SG for Ansible workers. SSH only from controller"
  vpc_id      = module.a06_vpc.vpc_id
  # Ingress Rules & CIDR Blocks
  ingress_rules       = ["ssh-tcp", "http-80-tcp", "all-icmp"]
  # ingress_cidr_blocks = [var.vpc_cidr]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  # Egress Rule - all-all open
  egress_rules = ["all-all"]
  tags         = local.common_tags
}

