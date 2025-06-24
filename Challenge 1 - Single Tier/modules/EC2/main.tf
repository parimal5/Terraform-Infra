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
  key_name   = var.key_name
  public_key = file(var.file_name)
}

resource "aws_instance" "web" {
  ami                         = data.aws_ami.AmazonLinuxAMI.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.web-server-key.key_name
  subnet_id                   = var.subnet_id
  security_groups             = var.security_groups
  associate_public_ip_address = var.publicIP
  user_data                   = file(var.inputFile)
  root_block_device {
    volume_size = var.ebs_size
    volume_type = var.ebs_type
    encrypted   = var.ebs_encryption
  }
  tags = {
    ENV = var.ENV
  }
}
