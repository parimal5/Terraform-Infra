variable "lb_target_group" {
  type = map(object({
    name                = string
    port                = number
    protocol            = string
    target_type         = string
    vpc_id              = string
    path                = string
    matcher             = string
    interval            = number
    timeout             = number
    healthy_threshold   = number
    unhealthy_threshold = number
  }))
}
variable "load_balancer" {
  type = map(object({
    name               = string
    internal           = bool
    load_balancer_type = string
    security_groups    = list(string)
    subnets            = list(string)
  }))
}

variable "lb_listener" {
  type = map(object({
    load_balancer_arn = string
    port              = number
    protocol          = string
    type              = string
    target_group_arn  = string
  }))
}
