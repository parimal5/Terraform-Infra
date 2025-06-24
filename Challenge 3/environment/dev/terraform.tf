#/module/vpc
variable "vpc_cidr_block" {
  type = string
}

variable "enable_dns_support" {
  type = bool
}

variable "enable_dns_hostnames" {
  type = bool
}
# variable "vpc_id" {
#   type = string
# }


#/module/subnets
variable "subnet" {
  type = map(object({
    name              = string
    cidr_block        = string
    availability_zone = string
    type              = string
  }))
}

#/modules/elasticIp
variable "elastic_ips" {
  type = map(string)
}


#modules/sg

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
    ip_protocol         = string
    from_port           = number
    to_port             = number
    cidr_ipv4           = optional(string)
    security_group_name = optional(string)
  }))
}
