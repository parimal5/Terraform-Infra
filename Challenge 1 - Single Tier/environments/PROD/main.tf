module "web-server" {
  source          = "../../modules/EC2"
  key_name        = var.key_pair_name
  instance_type   = var.instance_type
  subnet_id       = var.cidr_block_subnet_1
  security_groups = [module.sg.sg_id]
  ebs_size        = var.ebs_size
  ebs_type        = var.ebs_type
  ebs_encryption  = var.ebs_encryption
  file_name       = var.file_name
  ENV             = var.ENV
  publicIP        = var.publicIP
  inputFile       = var.inputFile
}
module "vpc" {
  source              = "../../modules/VPC"
  ENV                 = var.ENV
  cidr_block_subnet_1 = var.cidr_block_subnet_1
  cidr_block_VPC      = var.cidr_block_VPC
}


module "sg" {
  source        = "../../modules/SG"
  vpc_id        = var.vpc_id
  egress_rules  = var.egress_rules
  ingress_rules = var.ingress_rules
}
