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
  instance_tags ={
    Description = "리포트서버"
  }
  instance_state_names = ["running"]
}

resource "aws_lb_target_group_attachment" "reporttga" {
  count        = length(data.aws_instances.report.ids)
  target_group_arn = aws_lb_target_group.reporttg.arn
  target_id        = data.aws_instances.report.ids[count.index]
  port             = 80
}