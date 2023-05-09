resource "tls_private_key" "rsa" {
  algorithm = "RSA"
}

resource "local_file" "intern" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "intern.pem"
}

resource "aws_key_pair" "key121" {
  key_name   = "intern"
  public_key = tls_private_key.rsa.public_key_openssh
}
