resource "aws_nat_gateway" "nat_gatways" {

  for_each = var.nat_gatways

  allocation_id = each.value.allocation_id
  subnet_id     = each.value.subnet_id

  tags = {
    Name = each.key
  }

}
