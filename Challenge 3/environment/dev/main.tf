module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr_block       = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
}

module "subnets" {
  source = "../../modules/subnets"
  vpc_id = module.vpc.VPC_ID
  subnet = var.subnet
}
