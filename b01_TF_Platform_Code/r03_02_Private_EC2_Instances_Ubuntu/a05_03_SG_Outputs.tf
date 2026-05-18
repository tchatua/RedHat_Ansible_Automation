output "private_security_group_id" {
  description = "ID of private security group"
  value       = module.private_sg.security_group_id
}

output "private_security_group_vpc_id" {
  description = "VPC ID of VPC security group"
  value       = module.private_sg.security_group_vpc_id
}

output "private_security_group_name" {
  description = "Name of private security group"
  value       = module.private_sg.security_group_name
}