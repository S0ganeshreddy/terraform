resource "aws_subnet" "pub-sub1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "PUB-SUB1"
  }
}

resource "aws_subnet" "pvt-sub1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "PVT-SUB1"
  }
}
#end of subnets#

resource "aws_route_table" "pub-rt1" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }
  tags = {
    Name = "PUB-RT1"
  }
}

resource "aws_route_table" "pvt-rt1" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "PVT-RT1"
  }
}

#end of route-tables

resource "aws_route_table_association" "pub-asso1" {
  subnet_id      = aws_subnet.pub-sub1.id
  route_table_id = aws_route_table.pub-rt1.id
}

resource "aws_route_table_association" "pvt-asso1" {
  subnet_id      = aws_subnet.pvt-sub1.id
  route_table_id = aws_route_table.pvt-rt1.id
}
