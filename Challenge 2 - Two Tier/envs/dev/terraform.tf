variable "region" {}
variable "regionAlias" {}

variable "nat_names" {}

variable "cidr_block" {}
variable "enable_dns_support" {}
variable "enable_dns_hostnames" {}


# variable "SG" {
#   type = list(object({
#     name        = string
#     description = string
#     vpc_id      = string
#   }))
# }

variable "eip_names" {
  type = map(string)
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

variable "subnets" {
  type = list(object({
    name       = string
    az         = string
    cidr_block = string
    type       = string
  }))
}

# variable "ec2_instance" {
#   type = list(object({
#     instance_type               = string
#     key_name                    = string
#     monitoring                  = bool
#     security_group              = list(string)
#     subnet_id                   = string
#     user_data                   = string
#     associate_public_ip_address = bool
#     volume_size                 = number
#     volume_type                 = string
#   }))
# }

# variable "lb_target_group" {
#   type = map(object({
#     name                = string
#     port                = number
#     protocol            = string
#     target_type         = string
#     vpc_id              = string
#     path                = string
#     matcher             = string
#     interval            = number
#     timeout             = number
#     healthy_threshold   = number
#     unhealthy_threshold = number
#   }))
# }
# variable "load_balancer" {
#   type = map(object({
#     name               = string
#     internal           = bool
#     load_balancer_type = string
#     security_groups    = list(string)
#     subnets            = list(string)
#   }))
# }

# variable "lb_listener" {
#   type = map(object({
#     load_balancer_arn = string
#     port              = number
#     protocol          = string
#     type              = string
#     target_group_arn  = string
#   }))
# }
