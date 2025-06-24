variable "load_balancers" {
  type = map(object({
    name                       = string
    internal                   = bool
    load_balancer_type         = string
    subnets                    = list(string)
    enable_deletion_protection = bool
    security_groups            = list(string)
  }))
}

variable "lb_target_group" {

  type = map(object({
    name                = string
    port                = number
    protocol            = string
    target_type         = string
    path                = string
    interval            = number
    timeout             = number
    healthy_threshold   = number
    unhealthy_threshold = number
    matcher             = string
  }))
}


variable "lb_listener" {
  type = map(object({
    load_balancer_arn = string
    port              = string
    protocol          = string
    type              = string
    target_group_arn  = string
  }))
}


variable "vpc_id" {
  type = string
}
