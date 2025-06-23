variable "vpc_id" {
  type = string
}

variable "security_group" {
  type = map(object({
    description            = string
    revoke_rules_on_delete = bool
  }))
}

variable "rules" {
  type = map(object({
    name                = string
    direction           = string # "ingress" or "egress"
    from_port           = number
    to_port             = number
    ip_protocol         = string
    cidr_ipv4           = optional(string)
    security_group_name = optional(string)
  }))
}
