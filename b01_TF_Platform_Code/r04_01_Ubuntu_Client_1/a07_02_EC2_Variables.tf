## EC2 Variables
# EC2 Instance
## EC2 Instance Type
variable "instance_type" {
  type        = string
  description = "EC2 Instance Type"
  sensitive   = true
  # validation {
  # }
}
## EC2 Instance Key Pair
variable "instance_keypair" {
  type        = string
  description = "EC2 Key Pair for SSH Access"
  default     = "terraform_key_pem"
}
