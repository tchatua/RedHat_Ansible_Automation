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
}

# ##############################################################################################################
# AWS Provider
provider "aws" {
  profile = "default" # AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
  region  = local.aws_region.region
}
