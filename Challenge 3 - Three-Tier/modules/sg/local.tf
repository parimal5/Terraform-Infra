locals {
  ingress_rules = {
    for k, v in var.rules : k => v if v.direction == "ingress"
  }

  egress_rules = {
    for k, v in var.rules : k => v if v.direction == "egress"
  }
}
