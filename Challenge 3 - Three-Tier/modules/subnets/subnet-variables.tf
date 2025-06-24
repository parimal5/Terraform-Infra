variable "subnet" {
  type = map(object({
    name              = string
    cidr_block        = string
    availability_zone = string
    type              = string
  }))
}

variable "vpc_id" {
  type = string
}
