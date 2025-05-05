resource "aws_security_group" "mysg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = data.aws_vpc.vpc_data.id

  tags = {
    Name = "mysg"
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}



resource "aws_instance" "name" {
    ami = var.ami
    key_name =  aws_key_pair.mykeypair.id
    for_each = toset(data.aws_subnets.subnet_data.ids)
    subnet_id = each.value
    instance_type = "t2.micro"
    associate_public_ip_address = true
    security_groups = [aws_security_group.mysg.id]
    tags = {
      Name = "ec2-${each.key}"
    }
}