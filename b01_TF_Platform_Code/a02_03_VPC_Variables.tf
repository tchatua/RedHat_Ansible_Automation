# ###########################################################################
# Input Variables
# ###########################################################################
# a03 VPC Module
variable "vpc_name" {
  type        = string
  description = "VPC Name"
}
variable "vpc_cidr" {}
variable "azs" {}
variable "public_subnets" {}
# variable "private_subnets" {}
# variable "database_subnets" {}
