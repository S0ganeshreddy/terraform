resource "aws_route_table_association" "pub-asso" {
  subnet_id      = aws_subnet.pub-sub.id
  route_table_id = aws_route_table.pub-rt.id
}

resource "aws_route_table_association" "pvt-asso" {
  subnet_id      = aws_subnet.pvt-sub.id
  route_table_id = aws_route_table.pvt-rt.id
}
