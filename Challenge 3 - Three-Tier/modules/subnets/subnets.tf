resource "aws_subnet" "subnets" {
  vpc_id = var.vpc_id

  for_each = var.subnet

  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = each.value.type == "public" ? true : false
  tags = {
    Name = each.value.name
    type = each.value.type
  }
}

