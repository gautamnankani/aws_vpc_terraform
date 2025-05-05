resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "internet_gw"
  }
}

resource "aws_eip" "public_subnet_eip" {
    depends_on = [ aws_internet_gateway.internet_gw, aws_route_table_association.public_rt_associate ]
}

resource "aws_nat_gateway" "nat_gw" {
  subnet_id = aws_subnet.public_subnet.id
  allocation_id = aws_eip.public_subnet_eip.id

  tags = {
    Name = "nat_gw"
  }
}

