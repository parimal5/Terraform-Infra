variable "cidr_block_VPC" {
  type        = string
  description = "This is the VPC CIDR Block"
}
variable "cidr_block_subnet_1" {
  type        = string
  description = "This is the Subnet 1 CIDR Block"
}

variable "ENV" {
  type        = string
  description = "This value defines the Environement of our Infra"
}
