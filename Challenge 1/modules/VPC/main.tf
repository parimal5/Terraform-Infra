resource "aws_vpc" "VPC1" {
  cidr_block = var.cidr_block_VPC

  tags = {
    Name = "PROD"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.VPC1.id
  cidr_block = var.cidr_block_subnet_1

  tags = {
    Name = "PROD"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.VPC1.id

  tags = {
    Name = "PROD"
  }
}


resource "aws_internet_gateway_attachment" "igw_attachment" {
  vpc_id              = aws_vpc.VPC1.id
  internet_gateway_id = aws_internet_gateway.igw.id
}


resource "aws_route_table" "awsRT" {
  vpc_id = aws_vpc.VPC1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "PROD"
  }
}

resource "aws_route_table_association" "awsRTA" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.awsRT.id
}
