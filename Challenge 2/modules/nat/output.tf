output "nat_gateway_ids" {
  value = {
    for k, ngw in aws_nat_gateway.ngw : k => ngw.id
  }
}
