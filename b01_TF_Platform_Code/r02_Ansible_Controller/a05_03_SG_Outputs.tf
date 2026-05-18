output "ansible_security_group_id" {
  description = "ID of ansible controller security group"
  value       = module.ansible_controller_sg.security_group_id
}

output "ansible_security_group_vpc_id" {
  description = "VPC ID of VPC security group"
  value       = module.ansible_controller_sg.security_group_vpc_id
}

output "ansible_security_group_name" {
  description = "Name of ansible controller security group"
  value       = module.ansible_controller_sg.security_group_name
}