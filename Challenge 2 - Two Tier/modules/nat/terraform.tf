variable "ngw" {
  type = map(object({
    subnet_id     = string
    allocation_id = string
  }))
}
