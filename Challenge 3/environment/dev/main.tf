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


module "internet_gatweway" {
  source = "../../modules/igw"

  vpc_id = module.vpc.VPC_ID
}

module "elastic_ips" {
  source      = "../../modules/elasticIP"
  elastic_ips = var.elastic_ips
}

module "nat_gatway" {
  source = "../../modules/nat"

  nat_gatways = local.nat_gatway

  depends_on = [module.internet_gatweway]
}
