resource "aws_subnet" "subnets" {
  for_each = {
    for content in var.subnets : content.name => content
  }

  vpc_id                  = var.vpc_id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.az
  map_public_ip_on_launch = each.value.type == "public" ? true : false

  tags = {
    Name = each.key
  }
}
