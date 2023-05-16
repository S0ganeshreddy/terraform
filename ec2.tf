resource "aws_instance" "app" {
  ami                    = "ami-03c7d01cf4dedc891"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.pub-sub.id
  availability_zone      = "us-east-1a"
  key_name               = "intern"
  #user_data              = file("httpd.sh")
  vpc_security_group_ids = [aws_security_group.ssh-http.id]
  tags = {
    Name = "APP"
  }
}

#2nd instance

resource "aws_instance" "app1" {
  ami                    = "ami-03c7d01cf4dedc891"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.pub-sub1.id
  availability_zone      = "us-east-1b"
  key_name               = "intern"
  #user_data              = file("httpd.sh")
  vpc_security_group_ids = [aws_security_group.ssh-http.id]
  tags = {
    Name = "APP1"
  }
}

