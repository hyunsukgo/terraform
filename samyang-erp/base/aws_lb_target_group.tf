resource "aws_lb_target_group" "rttabtg" {
  name     = "${var.service_name}-rttab-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
}

module "aws_vpc" {
    source = ../
}