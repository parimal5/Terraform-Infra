output "instance_ids" {
  value = {
    for k, instance in aws_instance.web :
    k => instance.id
  }
}

output "private_ips" {
  value = {
    for k, instance in aws_instance.web :
    k => instance.private_ip
  }
}
