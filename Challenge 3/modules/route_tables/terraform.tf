variable "vpc_id" {
  type = string
}
variable "igw_id" {
  type = string
}

variable "nat_gateway" {
  type = map(object({
    nat_gateway_ids = string
  }))
}

variable "public_subnets" {
  type = map(string)
}
variable "private_subnets" {
  type = map(string)
}
