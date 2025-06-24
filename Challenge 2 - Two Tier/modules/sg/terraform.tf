variable "SG" {
  type = list(object({
    name        = string
    description = string
    vpc_id      = string
  }))
}

variable "rules" {
  type = list(object({
    sg_name        = string
    from_port      = string
    to_port        = string
    cidr_ipv4      = string
    source_sg_name = string
    ip_protocol    = string
  }))
}
