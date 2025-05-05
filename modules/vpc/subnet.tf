resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block.public_subnet
  availability_zone = var.az.public_subnet
  

  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block.private_subnet
  availability_zone = var.az.private_subnet

  tags = {
    Name = "private_subnet"
  }
}

resource "aws_subnet" "isolated_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block.isolated_subnet
  availability_zone = var.az.isolated_subnet

  tags = {
    Name = "isolated_subnet"
  }
}