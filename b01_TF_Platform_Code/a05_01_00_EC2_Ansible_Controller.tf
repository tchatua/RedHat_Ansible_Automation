# AWS EC2 Instance Terraform Module
# bastion Host - Ec2 Instance that will be created in VPC Public Subnet
module "ec2_public" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "6.1.5"
  name                   = "${var.buisness_division}-${var.environment}-Ansible-Controller"
  ami                    = data.aws_ami.rhel9.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  monitoring             = true
  subnet_id              = module.a06_vpc.public_subnets[0]
  vpc_security_group_ids = [module.ansible_controller_sg.security_group_id]
  user_data              = file("${path.module}/ansible_install.sh")
  # associate_public_ip_address = true
  tags = local.common_tags
}