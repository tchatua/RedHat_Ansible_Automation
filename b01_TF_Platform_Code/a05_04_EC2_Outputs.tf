# AWS EC2 Instance Terraform Outputs

/*

# Public EC2 Instances - Ansible Controller
output "ec2_instance_bastion_host_id" {
  description = "The ID of the EC2 Public Instance: Bastion Host"
  value       = module.ec2_public.id
}
## ec2_instance_bastion_public_ip
output "ec2_instance_bastion_host_public_ip" {
  description = "The public IP address assigned to the EC2 Public Instance: Bastion Host"
  value       = module.ec2_public.public_ip
}

# Private EC2 Instances 
## ec2_instance_private_id
output "ec2_instance_private_id" {
  description = "List of IDs of the EC2 Private Instances"
  value       = [for ec2private in module.ec2_private : ec2private.id]
}
## ec2_instance_private_ip
output "ec2_instance_private_ip" {
  description = "List of Private IP of the EC2 Private Instance"
  value       = [for ec2private in module.ec2_private : ec2private.private_ip]
}

*/