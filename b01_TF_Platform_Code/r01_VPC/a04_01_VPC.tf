module "genesis_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.5.1" # Best Practice
  # version = "~>6.5"

  # VPC Basic Details
  name                    = "${local.name}-${var.vpc_name}"
  cidr                    = local.vpc_module.cidr.vpc
  azs                     = local.vpc_module.azs
  public_subnets          = local.vpc_module.public_subnets
  map_public_ip_on_launch = true
  private_subnets         = local.vpc_module.private_subnets
  /*
  ## Database Subnets
  create_database_subnet_group       = true
  create_database_subnet_route_table = true
  database_subnets                   = local.vpc_module.database_subnets
  # create_database_nat_gateway_route = true
  # create_database_internet_gateway_route = true
  */

  # NAT Gateway - Outbound Communication
  enable_nat_gateway = true
  single_nat_gateway = true

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true
  public_subnet_tags = {
    Type = "Genesis-Public-Subnets"
  }

  private_subnet_tags = {
    Type = "Genesis-Private-Subnets"
  }

  /*
  database_subnet_tags = {
    Type = "Genesis-Database-Subnets"
  }
  */

  tags = {
    Owner       = "Tchatua"
    Environment = "Dev"
    EmailId     = "tchattua@gmail.com"
  }
  vpc_tags = local.common_tags
}