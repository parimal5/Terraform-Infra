resource "aws_lb" "load_balancer" {
  for_each = var.load_balancers

  name                       = each.value.name
  internal                   = each.value.internal
  load_balancer_type         = each.value.load_balancer_type
  security_groups            = each.value.security_groups
  subnets                    = each.value.subnets
  enable_deletion_protection = each.value.enable_deletion_protection
}


resource "aws_lb_target_group" "lb_target_group" {
  for_each = var.lb_target_group

  name        = each.value.name
  port        = each.value.port
  protocol    = each.value.protocol
  vpc_id      = var.vpc_id
  target_type = each.value.target_type
  health_check {
    path                = each.value.path
    interval            = each.value.interval
    timeout             = each.value.timeout
    healthy_threshold   = each.value.healthy_threshold
    unhealthy_threshold = each.value.unhealthy_threshold
    matcher             = each.value.matcher
  }
}

resource "aws_lb_listener" "front_end" {
  for_each          = var.lb_listener
  load_balancer_arn = each.value.load_balancer_arn
  port              = each.value.port
  protocol          = each.value.protocol
  default_action {
    type             = each.value.type
    target_group_arn = each.value.target_group_arn
  }
}
