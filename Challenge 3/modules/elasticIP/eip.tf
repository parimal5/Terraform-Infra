resource "aws_eip" "elastic_ips" {
  for_each = var.elastic_ips
  domain   = "vpc"
}
