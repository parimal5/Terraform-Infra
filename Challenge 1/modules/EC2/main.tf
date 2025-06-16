data "aws_ami" "AmazonLinuxAMI" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "web-server-key" {
  key_name   = var.key_pair_name
  public_key = file(var.file_name)
}

resource "aws_instance" "web" {
  ami                         = data.aws_ami.AmazonLinuxAMI
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.web-server-key.key_name
  subnet_id                   = var.vpc_id
  security_groups             = [var.sg]
  associate_public_ip_address = var.publicIP
  root_block_device {
    volume_size = var.ebs-size
    volume_type = var.ebs-type
    encrypted   = var.ebs-encryption
  }
}
