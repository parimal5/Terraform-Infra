resource "aws_security_group" "web_app_sg" {
  vpc_id      = var.vpc_id
  name        = "allow_ssh_http"
  description = "This SG allows SSH and HTTP port for the instance"
  tags = {
    Name = "PROD"
  }
}

# Note:
# - `for_each` requires a map or a set
# - Sets don't support complex objects (like list of objects)
# - So we convert list of objects to a map using index as key
# - The index key is just a placeholder to satisfy `for_each`'s map requirement

resource "aws_vpc_security_group_ingress_rule" "ingress rule" {
  security_group_id = aws_security_group.web_app_sg.id

  for_each = { for index, obj in var.ingress_rules : index => obj }

  from_port   = each.value.from_port
  to_port     = each.value.to_port
  ip_protocol = each.value.protocol
  cidr_ipv4   = each.value.cidr_blocks[0]
  description = each.value.description
}

resource "aws_vpc_security_group_egress_rule" "egress_rule" {
  security_group_id = aws_security_group.web_app_sg.id

  for_each = { for index, obj in var.egress_rules : index => obj }

  from_port   = each.value.from_port
  to_port     = each.value.to_port
  ip_protocol = each.value.protocol
  cidr_ipv4   = each.value.cidr_blocks[0]
  description = each.value.description
}

