output "eip_ids" {
  value = {
    for k, eip in aws_eip.elasticIP :
    k => eip.id
  }
}
