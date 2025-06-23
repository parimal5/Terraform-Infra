output "public_subnet_ids" {
  value = { for key, value in aws_subnet.subnets : key => value.id if value.tags["type"] == "public" }
}

output "private_subnet_ids" {
  value = { for key, value in aws_subnet.subnets : key => value.id if value.tags["type"] == "private" }
}
output "db_subnet_ids" {
  value = { for key, value in aws_subnet.subnets : key => value.id if value.tags["type"] == "db" }
}
