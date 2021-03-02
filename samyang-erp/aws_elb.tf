resource "aws_lb_target_group" "reporttg" {
  name     = "report-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
  tags = {
      envirornment = "Non SAP"
  }
}


data "aws_instances" "report" {
  filter {
    name   = "tag:Name"
    values = ["sy-rptab01","sy-rptab02"]
  }
}

resource "aws_lb_target_group_attachment" "reporttga" {
  for_each         = data.aws_instance.report.ids
  target_group_arn = aws_lb_target_group.reporttg.arn
  target_id        = each.value
  port             = 80
}