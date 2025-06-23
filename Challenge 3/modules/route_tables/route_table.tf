resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }
}

resource "aws_route_table_association" "pub_rt_association" {
  route_table_id = aws_route_table.public_route_table.id

  for_each = var.public_subnets

  subnet_id = each.value
}

resource "aws_route_table" "private_route_table" {
  vpc_id   = var.vpc_id
  for_each = var.nat_gateway

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = each.value.nat_gateway_ids
  }
}



resource "aws_route_table_association" "prvt_rt_association" {
  for_each = var.private_subnets

  route_table_id = aws_route_table.private_route_table[each.key].id

  subnet_id = each.value
}
