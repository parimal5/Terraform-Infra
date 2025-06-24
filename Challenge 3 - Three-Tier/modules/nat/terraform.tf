variable "nat_gatways" {
  type = map(object({
    allocation_id = string
    subnet_id     = string
  }))
}
