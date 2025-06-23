locals {
  nat_gatway = {
    "nat-1" = {
      allocation_id = module.elastic_ips.elastic_ip["eip-1"]
      subnet_id     = module.subnets.public_subnet_ids["public-subnet-1"]
    },
    "nat-2" = {
      allocation_id = module.elastic_ips.elastic_ip["eip-2"]
      subnet_id     = module.subnets.public_subnet_ids["public-subnet-2"]
    }
  }
}
