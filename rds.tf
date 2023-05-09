resource "aws_db_subnet_group" "rds" {
  name       = "rds"
  subnet_ids = [aws_subnet.pvt-sub.id, aws_subnet.pvt-sub1.id]

  tags = {
    Name = "RDS"
  }
}

resource "aws_db_instance" "rds" {
  allocated_storage    = 10
  db_subnet_group_name = aws_db_subnet_group.rds.id
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0.23"
  instance_class       = "db.t2.micro"
  multi_az             = true
  username             = "admini"
  password             = "admin123"
  #parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.db-sg.id]
}
