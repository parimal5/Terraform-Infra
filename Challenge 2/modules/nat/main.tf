resource "aws_nat_gateway" "ngw" {
  for_each = var.ngw

  subnet_id     = each.value.subnet_id
  allocation_id = each.value.allocation_id
}
