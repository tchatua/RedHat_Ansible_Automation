locals {
  vpc_module = {
    cidr = {
      vpc = var.vpc_cidr
    }
    azs            = var.azs
    public_subnets = var.public_subnets
    # private_subnets = var.private_subnets
  }
}
