resource "aws_lb_target_group" "rttabtg" {
  name     = "rttab-lb-tg"
  port     = 80
  protocol = "HTTP"
  #vpc_id   = aws_vpc.vpc.id
}

