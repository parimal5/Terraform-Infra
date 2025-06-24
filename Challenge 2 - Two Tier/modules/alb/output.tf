output "alb_arns" {
  value = {
    for k, alb in aws_lb.lb : k => alb.arn
  }
}

output "target_group_arns" {
  value = {
    for k, tg in aws_lb_target_group.lb_target_group : k => tg.arn
  }
}
