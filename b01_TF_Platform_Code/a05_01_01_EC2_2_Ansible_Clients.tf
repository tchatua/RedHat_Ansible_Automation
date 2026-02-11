# AWS EC2 Instance Terraform Module
# bastion Host - Ec2 Instance that will be created in VPC Public Subnet
module "ec2_ansibleclient" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.1.5"

  depends_on             = [module.a06_vpc]
  name                   = "${var.buisness_division}-${var.environment}-Ansible-Client-${each.key}"
  ami                    = data.aws_ami.ubuntu_2204.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  monitoring             = true
  for_each               = toset(["0", "1"])
  subnet_id              = element(module.a06_vpc.public_subnets, tonumber(each.key))
  vpc_security_group_ids = [module.ansible_worker_sg.security_group_id]
  user_data              = file("${path.module}/app1_install.sh")
  tags                   = local.common_tags
}
