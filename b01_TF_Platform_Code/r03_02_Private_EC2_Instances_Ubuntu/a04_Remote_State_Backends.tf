/*
  The terraform_remote_state Data Source
  retrieve the root module output values from some other Terraform configuration
*/

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "tchatuabucket12262025"           # S3 bucket where the Terraform state file will be stored. central shared location for the state file
    key    = "genesis/dev/r01_vpc/vpc.tfstate" # Path and filename of the state file inside the S3 bucket
    region = "us-east-2"                       # AWS region where the S3 bucket is hosted
  }
}

/*
vpc_id    = data.terraform_remote_state.vpc.outputs.vpc_id
subnet_id = data.terraform_remote_state.vpc.outputs.public_subnet_ids[0]

subnet_id = data.terraform_remote_state.vpc.outputs.public_subnets[0]

vpc_security_group_ids = data.terraform_remote_state.vpc.outputs.security_group_id
*/
