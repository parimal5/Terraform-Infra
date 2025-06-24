variable "ec2_instance" {
  type = map(object({
    instance_type               = string
    key_name                    = string
    volume_type                 = string
    subnet_id                   = string
    monitoring                  = bool
    associate_public_ip_address = bool
    volume_size                 = number
    security_groups             = list(string)
  }))
}
