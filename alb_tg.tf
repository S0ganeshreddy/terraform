resource "aws_lb_target_group" "tg" {
  name     = "TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.myvpc.id
}

resource "aws_lb_target_group_attachment" "attach" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.app.id
  port             = 80
  depends_on       = [aws_instance.app]
}

resource "aws_lb_target_group_attachment" "attach1" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.app1.id
  port             = 80
  depends_on       = [aws_instance.app1]
}

resource "aws_lb_listener" "fro" {
  load_balancer_arn = aws_lb.aplb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

###########load balancer###################################
resource "aws_lb" "aplb" {
  name               = "APLB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ssh-http.id]
  subnets            = [aws_subnet.pub-sub.id, aws_subnet.pub-sub1.id]
}
