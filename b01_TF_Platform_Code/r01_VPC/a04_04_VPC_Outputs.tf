# VPC ID

output "vpc_id" {
  description = "VPC ID"
  value       = module.genesis_vpc.vpc_id
}
# VPC CIDR Block
output "vpc_cidr_blocks" {
  description = "VPC CIDR Blocks"
  value       = module.genesis_vpc.vpc_cidr_block
}
# Public Subnet IDs
output "public_subnet_ids" {
  description = "Public Subnet ID"
  value       = module.genesis_vpc.public_subnets
}
# Private Subnet IDs
output "private_subnet_ids" {
  description = "Public Subnet ID"
  value       = module.genesis_vpc.private_subnets
}
# Public Subnet CIDR Blocks
output "public_subnet_cidr_blocks" {
  description = "Public Subnet CIDR Blocks"
  value       = module.genesis_vpc.public_subnets_cidr_blocks
}
# Private Subnet CIDR Blocks
output "private_subnet_cidr_blocks" {
  description = "Private Subnet CIDR Blocks"
  value       = module.genesis_vpc.private_subnets_cidr_blocks
}
# A list of availability zones specified as argument to this module
output "availabilityzones" {
  description = "List of availability zones specified as argument to this module"
  value       = module.genesis_vpc.azs
}
