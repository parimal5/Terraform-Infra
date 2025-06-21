resource "aws_lb_target_group" "lb_target_group" {
  for_each = { for idx, content in var.lb_target_group : idx => content }

  name        = each.value.name
  target_type = each.value.target_type
  port        = each.value.port
  protocol    = each.value.protocol
  vpc_id      = each.value.vpc_id

  health_check {
    path                = each.value.path
    protocol            = each.value.protocol
    matcher             = each.value.matcher
    interval            = each.value.interval
    timeout             = each.value.timeout
    healthy_threshold   = each.value.healthy_threshold
    unhealthy_threshold = each.value.unhealthy_threshold
  }
}

resource "aws_lb" "lb" {
  for_each = { for idx, content in var.load_balancer : idx => content }

  name               = each.value.name
  internal           = each.value.internal
  load_balancer_type = each.value.load_balancer_type
  security_groups    = each.value.security_groups
  subnets            = each.value.subnets
}

resource "aws_lb_listener" "http" {
  for_each = { for idx, content in var.lb_listener : idx => content }

  load_balancer_arn = each.value.load_balancer_arn
  port              = each.value.port
  protocol          = each.value.protocol

  default_action {
    type             = each.value.type
    target_group_arn = each.value.target_group_arn
  }

}
