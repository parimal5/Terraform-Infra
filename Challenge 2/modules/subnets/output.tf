locals {
  subnet_type_map = { for s in var.subnets : s.name => s.type }
}

output "public_subnets" {
  value = {
    for name, subnet in aws_subnet.subnets :
    name => subnet.id if local.subnet_type_map[name] == "public"
  }
}

output "private_subnets" {
  value = {
    for name, subnet in aws_subnet.subnets :
    name => subnet.id if local.subnet_type_map[name] == "private"
  }
}
