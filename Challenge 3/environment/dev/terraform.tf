#/module/vpc
variable "vpc_cidr_block" {
  type = string
}

variable "enable_dns_support" {
  type = bool
}

variable "enable_dns_hostnames" {
  type = bool
}
# variable "vpc_id" {
#   type = string
# }


#/module/subnets
variable "subnet" {
  type = map(object({
    name              = string
    cidr_block        = string
    availability_zone = string
    type              = string
  }))
}

#/modules/elasticIp
variable "elastic_ips" {
  type = map(string)
}


