# AWS EC2 Instance Terraform Module
# bastion Host - Ec2 Instance that will be created in VPC Public Subnet
module "ec2_private" {
  
  depends_on = [ 
    data.terraform_remote_state.vpc 
  ]

  source        = "terraform-aws-modules/ec2-instance/aws"
  version       = "6.1.5"

  # # Create 2 EC2 instances
  # count         = 2
  

  # Auto‑naming with count.index
  name          = "${var.buisness_division}-${var.environment}-RedHat-App-Server-${each.key}"
  ami           = data.aws_ami.amzlinux2023.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair
  monitoring    = true

  for_each  = toset(["0", "1"])
  subnet_id = element(data.terraform_remote_state.vpc.outputs.private_subnet_ids, tonumber(each.key))
  # subnet_id              = element(module.a06_vpc.private_subnets, tonumber(each.key))
  # subnet_id              = module.a06_vpc.public_subnets[0]
  # subnet_id = data.terraform_remote_state.vpc.outputs.private_subnet_ids

  vpc_security_group_ids = [module.private_sg.security_group_id]

  user_data = file("${path.module}/app1_install.sh")
  # associate_public_ip_address = true
  tags = local.common_tags
}
