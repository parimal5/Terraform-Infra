output "load_balancer_arn" {
  value = {
    for k, v in aws_lb.load_balancer : k => v.arn
  }
}


output "target_group_arn" {
  value = {
    for k, v in aws_lb_target_group.lb_target_group : k => v.arn
  }
}
