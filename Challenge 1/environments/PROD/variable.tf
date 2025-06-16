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


