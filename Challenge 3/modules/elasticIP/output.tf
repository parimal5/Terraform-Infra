output "elastic_ip" {
  value = {
    for k, v in aws_eip.elastic_ips : k => v.id
  }
}


