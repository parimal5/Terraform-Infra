resource "aws_security_group" "security_group" {
  vpc_id = var.vpc_id

  for_each = var.security_group

  name                   = each.key
  description            = each.value.description
  revoke_rules_on_delete = each.value.revoke_rules_on_delete // true if we need custom egress

}
resource "aws_vpc_security_group_ingress_rule" "ingress_rule" {
  for_each          = local.ingress_rules
  security_group_id = aws_security_group.security_group[each.value.name].id
  ip_protocol       = each.value.ip_protocol
  from_port         = each.value.from_port
  to_port           = each.value.to_port

  cidr_ipv4 = each.value.security_group_name == null ? each.value.cidr_ipv4 : null
  referenced_security_group_id = (
    each.value.security_group_name != null ?
    aws_security_group.security_group[each.value.security_group_name].id : null
  )
}

resource "aws_vpc_security_group_egress_rule" "egress_rule" {
  for_each          = local.egress_rules
  security_group_id = aws_security_group.security_group[each.value.name].id
  ip_protocol       = each.value.ip_protocol
  from_port         = each.value.from_port
  to_port           = each.value.to_port

  cidr_ipv4 = each.value.security_group_name == null ? each.value.cidr_ipv4 : null
  referenced_security_group_id = (
    each.value.security_group_name != null ?
    aws_security_group.security_group[each.value.security_group_name].id : null
  )
}

