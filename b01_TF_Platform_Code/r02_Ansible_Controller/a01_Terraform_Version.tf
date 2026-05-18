# ##############################################################################################################
# Terraform Block
terraform {
  required_version = "~> 1.14" # trerraform --version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.27"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2.4"
    }
  }
  # Terraform S3 Backend Block
  backend "s3" {
    bucket = "tchatuabucket12262025" # S3 bucket where the Terraform state file will be stored. central shared location for the state file
    # key    = "sre_iac_lab/dev/a01_VPC/terraform.tfstate" # Path and filename of the state file inside the S3 bucket
    key    = "genesis/dev/r02_ansible_controller/ansible_controller.tfstate" # Path and filename of the state file inside the S3 bucket
    region = "us-east-2"                                                     # AWS region where the S3 bucket is hosted

    # For State Locking
    dynamodb_table = "dev_project1_vpc"
  }
}

# ##############################################################################################################
# AWS Provider
provider "aws" {
  profile = "default" # AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
  region  = local.aws_region.region
}

# ##############################################################################################################
# Backend


