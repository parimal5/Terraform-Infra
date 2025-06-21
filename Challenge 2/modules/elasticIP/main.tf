resource "aws_eip" "elasticIP" {
  for_each = var.eip_names
  domain   = "vpc"
}
