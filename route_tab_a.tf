resource "aws_route_table" "pub-rt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }
  tags = {
    Name = "PUB-RT"
  }
}

resource "aws_route_table" "pvt-rt" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "PVT-RT"
  }
}
