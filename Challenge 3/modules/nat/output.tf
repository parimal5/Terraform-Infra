output "NAT_ID" {
  value = {
    for k, v in aws_nat_gateway.nat_gatways : k => v.id
  }
}
