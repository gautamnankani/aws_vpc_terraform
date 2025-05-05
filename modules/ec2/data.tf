data "aws_vpc" "vpc_data" {
    tags = {
      Name= var.vpc_name
    }
}

data "aws_subnets" "subnet_data" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc_data.id]
  }
}