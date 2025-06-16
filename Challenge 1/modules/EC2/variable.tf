variable "instance_type" {
  type        = string
  description = "This is the instance type"
}
variable "key_name" {
  type        = string
  description = "This is the key_pair_name type"
}

variable "file_name" {
  type        = string
  description = "This is the  File Name"
}

variable "subnet_id" {
  type        = string
  description = "This is the VPC ID"
}

variable "security_groups" {
  type        = list(string)
  description = "This is the Security Group"
}

variable "publicIP" {
  type        = bool
  description = "This is the public IP status"
}

variable "ebs_size" {
  type        = number
  description = "This is EBS size"
}

variable "ebs_type" {
  type        = string
  description = "This is EBS Type"
}

variable "ebs_encryption" {
  type        = bool
  description = "This is encription variable"
}

variable "ENV" {
  type        = string
  description = "This value defines the module"
}

variable "inputFile" {
  type        = string
  description = "This is the bash script"
}
