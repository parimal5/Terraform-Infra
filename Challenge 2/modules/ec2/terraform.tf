variable "ec2_instance" {
  type = list(object({
    instance_type               = string
    key_name                    = string
    monitoring                  = bool
    security_group              = list(string)
    subnet_id                   = string
    user_data                   = string
    associate_public_ip_address = bool
    volume_size                 = number
    volume_type                 = string
  }))
}
