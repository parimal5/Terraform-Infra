resource "aws_security_group" "SG" {
  for_each = { for groups in var.SG : groups.name => groups }

  name        = each.value.name
  description = each.value.description
  vpc_id      = each.value.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "name" {


  # This will not work becauses
  # Your aws_security_group.SG resource is defined with for_each:
  # So, aws_security_group.SG becomes a map, not a single object.
  # aws_security_group.SG is a map of objects, so you must access an element with a key: aws_security_group.SG["key"].id

  #! security_group_id = aws_security_group.SG.id

  security_group_id = aws_security_group.SG[each.value.sg_name].id
  for_each          = { for idx, rules in var.rules : idx => rules }

  from_port = each.value.from_port
  to_port   = each.value.to_port
  cidr_ipv4 = each.value.cidr_ipv4
  referenced_security_group_id = (
    each.value.source_sg_name != null ?
    aws_security_group.SG[each.value.source_sg_name].id :
    null
  )
  ip_protocol = each.value.ip_protocol
}
resource "aws_vpc_security_group_egress_rule" "name" {
  security_group_id = aws_security_group.SG[each.value.sg_name].id
  for_each          = { for idx, rules in var.rules : idx => rules }

  from_port   = each.value.from_port
  to_port     = each.value.to_port
  ip_protocol = each.value.ip_protocol
  cidr_ipv4   = each.value.cidr_ipv4
  referenced_security_group_id = (
    each.value.source_sg_name != null ?
    aws_security_group.SG[each.value.source_sg_name].id :
    null
  )
}
