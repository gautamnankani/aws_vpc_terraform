variable "az" {
  type = map(string)
  default = {
    "public_subnet": "us-east-1a",
    "private_subnet": "us-east-1b",
    "isolated_subnet": "us-east-1c"
  }
  description = "Availability zone for subnet"
}

variable "cidr_block" {
  type = map(string)
  default = {
    "vpc": "192.168.0.0/16",
    "public_subnet": "192.168.0.0/24",
    "private_subnet": "192.168.1.0/24",
    "isolated_subnet": "192.168.2.0/24"
  }
  description = "ip block for subnet"
}

variable "az_public_subnet" {
  default = "us-east-1a"
  type = string
  description = "Availability zone for public subnet"
}
