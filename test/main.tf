provider "aws" {
  region = "us-east-1"
  access_key = "..."
  secret_key = "..."
}

module "ec2" {
  source = "../modules/ec2"
}