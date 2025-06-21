# locals {
#   nat_gatways = {
#     for name in var.nat_names : names => {
#       subnet_id     = aws_subnet.subnets["public_subnet_1"].id
#       allocation_id = modules.elasticIP.eip_id
#     }
#   }

#   # nat_ids = values(aws_nat_gateway.ngw)[*].id

#   nat_ids = { for idx, content in aws_nat_gateway.ngw : idx => content.id }

#   alb_sg_id = aws_security_group.SG["alb-sg"].id
#   ec2_sg_id = aws_security_group.SG["ec2-sg"].id
# }

