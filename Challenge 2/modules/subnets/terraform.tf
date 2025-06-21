variable "subnets" {
  type = list(object({
    name       = string
    az         = string
    cidr_block = string
    type       = string
  }))
}

variable "vpc_id" {}
