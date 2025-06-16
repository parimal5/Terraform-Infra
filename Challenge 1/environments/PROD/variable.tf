variable "region" {
  type        = string
  description = "This is the region for Infra"
}

variable "vpc_id" {
  type        = string
  description = "This is the VPC ID"
}

variable "cidr_block_VPC" {
  type        = string
  description = "This is the VPC CIDR Block"
}
variable "cidr_block_subnet_1" {
  type        = string
  description = "This is the Subnet 1 CIDR Block"
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
}

variable "egress_rules" {
  description = "List of egress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
}


variable "instance_type" {
  type        = string
  description = "This is the instance type"
}

variable "key_pair_name" {
  type        = string
  description = "This is the key_pair_name type"
}

variable "sg" {
  type        = string
  description = "This is the Security Group"
}

variable "publicIP" {
  type        = bool
  description = "This is the public IP status"
}

variable "ebs-size" {
  type        = number
  description = "This is EBS size"
}

variable "ebs_type" {
  type        = string
  description = "This is EBS Type"
}

variable "ebs_encryption" {
  type        = bool
  description = "This is encription variable"
}


variable "ENV" {
  type        = string
  description = "This value defines the Environement of our Infra"
}


variable "ami" {
  type        = string
  description = "This is the AMI used"
}
