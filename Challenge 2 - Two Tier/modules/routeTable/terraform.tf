variable "vpc_id" {}
variable "igw_id" {}
variable "ngw_ids" {
  type = map(string)
}

variable "public_subnet_ids" {
  type = map(string) # or list(string) if not named
}

variable "private_subnet_map" {
  type = map(object({
    subnet_id = string
    nat_key   = string
  }))
}



# Note: We have one public route for all public subnet but muultiple private route table for each nat gateway so that is why we need that extra variable
