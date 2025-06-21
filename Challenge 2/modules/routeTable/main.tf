resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }
}

resource "aws_route_table" "private_rt" {
  for_each = var.private_subnet_map

  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.ngw_ids[each.value.nat_key]
  }
}


resource "aws_route_table_association" "public_association" {
  for_each       = var.public_subnet_ids
  subnet_id      = each.value
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_association" {
  for_each       = var.private_subnet_map
  subnet_id      = each.value.subnet_id
  route_table_id = aws_route_table.private_rt[each.key].id
}
