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

module "routeTables" {
  source = "../../modules/route_tables"

  vpc_id          = module.vpc.VPC_ID
  igw_id          = module.internet_gatweway.IGW_ID
  public_subnets  = module.subnets.public_subnet_ids
  private_subnets = module.subnets.private_subnet_ids
  nat_gateway     = local.nat_gateway_routeTable
}

module "security_group" {
  source = "../../modules/sg"

  vpc_id = module.vpc.VPC_ID

  security_group = var.security_group

  rules = var.rules
}

module "ec2_instance" {
  source = "../../modules/ec2"

  ec2_instance = local.ec2_instance
}
