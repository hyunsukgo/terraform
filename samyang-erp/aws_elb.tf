resource "aws_lb_target_group" "reporttg" {
  name     = "report-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
  tags = {
      envirornment = "Non SAP"
  }
}


data "aws_instance" "report" {
  filter {
    name   = "tag:Description"
    values = "리포트서버"
  }
}
resource "aws_lb_target_group_attachment" "reporttga" {
  target_group_arn = aws_lb_target_group.reporttg.arn
  target_id        = data.aws_instance.report[*].id
  port             = 80
}