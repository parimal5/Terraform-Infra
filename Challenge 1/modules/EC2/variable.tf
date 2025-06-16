variable "instance_type" {
  type        = string
  description = "This is the instance type"
}
variable "key_pair_name" {
  type        = string
  description = "This is the key_pair_name type"
}

variable "file_name" {
  type        = string
  description = "This is the public key"
}

variable "vpc_id" {
  type        = string
  description = "This is the VPC ID"
}

variable "sg" {
  type        = string
  description = "This is the Security Group"
}

variable "publicIP" {
  type        = bool
  description = "This is the public IP status"
}

variable "ebs-size" {
  type        = number
  description = "This is EBS size"
}

variable "ebs-type" {
  type        = string
  description = "This is EBS Type"
}

variable "ebs-encryption" {
  type        = bool
  description = "This is encription variable"
}
