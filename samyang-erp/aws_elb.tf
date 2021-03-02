# Configure Target Group
resource "aws_lb_target_group" "reporttg" {
  name     = "report-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
  tags = {
      envirornment = "Non SAP"
  }
}
# Setting Target Instances
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

# Creater Load Balancer(ALB)
data "aws_subnet_ids" "internal" {
  vpc_id = aws_vpc.vpc.id
  filter {
    name   = "tag:LoadBalancing"
    values = ["Private"] # insert values here
  }
  /*
  tags = {
    LoadBalancing = "Private"
  }
  */
}
/*
resource "aws_lb" "reportlb" {
  name               = "report-alb"
  internal           = true
  load_balancer_type = "application"
  # Configure at next block
  security_groups    = [aws_security_group.allow_from_trust_to_report_alb.id]
  for_each           = data.aws_subnet_ids.internal.ids
  subnets            = each.value

  tags = {
    Environment = "Production"
  }
}

resource "aws_security_group" "allow_from_trust_to_report_alb" {
  name        = "allow_traffic_reportalb"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "RDP from On-Prem"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.200.0.0/16"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_from_trust_to_report_alb"
  }
} 


resource "aws_lb_listener" "reportlb" {
  load_balancer_arn = aws_lb.reportlb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.reporttg.arn
  }
}
*/