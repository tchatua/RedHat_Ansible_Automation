# ##############################################################################################################
locals {
  owners      = var.buisness_division
  environment = var.environment
  name        = "${var.buisness_division}-${var.environment}"
  #   name = "${var.owners}-${var.environment}"
  common_tags = {
    owners      = local.owners
    environment = local.environment
  }
  aws_region = {
    profile = var.profile
    region  = var.location
  }
}