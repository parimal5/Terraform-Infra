data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami      = data.aws_ami.ubuntu.id
  for_each = { for idx, instances in var.ec2_instance : idx => instances }

  instance_type               = each.value.instance_type
  key_name                    = each.value.key_name
  monitoring                  = each.value.monitoring
  vpc_security_group_ids      = each.value.security_group
  subnet_id                   = each.value.subnet_id
  user_data                   = each.value.user_data
  associate_public_ip_address = each.value.associate_public_ip_address
  root_block_device {
    volume_size = each.value.volume_size
    volume_type = each.value.volume_type
  }

}
