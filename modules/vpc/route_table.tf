//public
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.cidr_block.vpc
    gateway_id = "local"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gw.id
  }
  tags = {
    Name = "public_rt"
  }
}

resource "aws_route_table_association" "public_rt_associate" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

//private

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.cidr_block.vpc
    gateway_id = "local"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "private_rt"
  }
}

resource "aws_route_table_association" "private_rt_associate" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}

//isolated

resource "aws_route_table" "isolated_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.cidr_block.vpc
    gateway_id = "local"
  }

  tags = {
    Name = "isolated_rt"
  }
}

resource "aws_route_table_association" "isolated_rt_associate" {
  subnet_id      = aws_subnet.isolated_subnet.id
  route_table_id = aws_route_table.isolated_rt.id
}