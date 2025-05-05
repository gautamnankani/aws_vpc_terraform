resource "tls_private_key" "mykey" {
    algorithm = "RSA"
    rsa_bits = 2048
    
}

resource "aws_key_pair" "mykeypair" {
  key_name   = "mykey"
  public_key = tls_private_key.mykey.public_key_openssh
}

resource "local_sensitive_file" "name" {
  content = tls_private_key.mykey.private_key_pem
  filename = "../mykey.pem"
  file_permission = "0644"
}