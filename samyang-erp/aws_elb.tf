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

resource "aws_lb_target_group" "sap-web" {
  name     = "sap-web-tg"
  port     = 8000
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
  tags = {
    envirornment = "SAP"
  }
}

resource "aws_lb_target_group" "po-web" {
  name     = "po-web-tg"
  port     = 50000
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
  tags = {
    envirornment = "SAP"
  }
}


resource "aws_lb_target_group" "sap-int" {
  name     = "sap-int-tg"
  port     = 8000
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
  tags = {
    envirornment = "SAP"
  }
}

resource "aws_lb_target_group" "po-int" {
  name     = "po-int-tg"
  port     = 50000
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
  tags = {
    envirornment = "SAP"
  }
}

resource "aws_lb_target_group" "po" {
  name     = "po-tg"
  port     = 8120
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
  tags = {
    envirornment = "SAP"
  }
}


resource "aws_lb_target_group_attachment" "po-tga" {
  count            = length(data.aws_instances.sap-web.ids)
  target_group_arn = aws_lb_target_group.sap-web.arn
  target_id        = data.aws_instances.sap-web.ids[count.index]
  port             = 8120
}

resource "aws_lb_listener" "po-listener" {
  load_balancer_arn = aws_lb.reportlb.arn
  port              = "8120"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.po.arn
  }
}

resource "aws_lb_listener_rule" "po" {
  listener_arn = aws_lb_listener.reportlb.arn
  priority     = 102

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.po.arn
  }

  condition {
    host_header {
      values = [var.pourl]
    }
  }
}

resource "aws_lb_target_group_attachment" "sap-web-tga" {
  count            = length(data.aws_instances.sap-web.ids)
  target_group_arn = aws_lb_target_group.sap-web.arn
  target_id        = data.aws_instances.sap-web.ids[count.index]
  port             = 8000
}


data "aws_instances" "sap-web" {
  instance_tags = {
    ALB = "sap-interface"
  }
  instance_state_names = ["running"]
}

resource "aws_lb_target_group_attachment" "sap-int-tga" {
  count            = length(data.aws_instances.sap-web.ids)
  target_group_arn = aws_lb_target_group.sap-int.arn
  target_id        = data.aws_instances.sap-web.ids[count.index]
  port             = 8000
}


resource "aws_lb_target_group_attachment" "po-int-tga" {
  count            = length(data.aws_instances.po-web.ids)
  target_group_arn = aws_lb_target_group.po-int.arn
  target_id        = data.aws_instances.po-web.ids[count.index]
  port             = 50000
}


data "aws_instances" "po-web" {
  instance_tags = {
    ALB = "po-interface"
  }
  instance_state_names = ["running"]
}

resource "aws_lb_target_group_attachment" "po-web-tga" {
  count            = length(data.aws_instances.po-web.ids)
  target_group_arn = aws_lb_target_group.po-web.arn
  target_id        = data.aws_instances.po-web.ids[count.index]
  port             = 50000
}

# Setting Target Instances
data "aws_instances" "report" {
  instance_tags = {
    Description = "리포트서버"
  }
  instance_state_names = ["running"]
}

resource "aws_lb_target_group_attachment" "reporttga" {
  count            = length(data.aws_instances.report.ids)
  target_group_arn = aws_lb_target_group.reporttg.arn
  target_id        = data.aws_instances.report.ids[count.index]
  port             = 80
}

# Creater Load Balancer(ALB)
data "aws_subnet_ids" "internal" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    LoadBalancing = "Private"
  }
}

resource "aws_lb" "reportlb" {
  name               = "report-alb"
  internal           = true
  load_balancer_type = "application"
  # Configure at next block
  security_groups = [aws_security_group.allow_from_trust_to_report_alb.id]
  subnets         = data.aws_subnet_ids.internal.ids
  enable_deletion_protection = true
  idle_timeout = 1800
  tags = {
    Environment = "Production"
  }
}

resource "aws_security_group" "allow_from_trust_to_report_alb" {
  name        = "allow_traffic_reportalb"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "HTTP for Report"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  ingress {
    description     = "HTTP for PO-Interface"
    from_port       = 8000
    to_port         = 8000
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  ingress {
    description     = "HTTP for PO-Interface"
    from_port       = 8120
    to_port         = 8120
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  ingress {
    description     = "HTTP for PO-Interface"
    from_port       = 50000
    to_port         = 50000
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
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

resource "aws_lb_listener_rule" "rttab" {
  listener_arn = aws_lb_listener.reportlb.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.reporttg.arn
  }

  condition {
    host_header {
      values = [var.reporturl]
    }
  }
}

resource "aws_lb_listener" "po-web-listener" {
  load_balancer_arn = aws_lb.reportlb.arn
  port              = "50000"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.po-web.arn
  }
}

resource "aws_lb_listener" "sap-web-listener" {
  load_balancer_arn = aws_lb.reportlb.arn
  port              = "8000"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.sap-web.arn
  }
}

resource "aws_lb_listener_rule" "sap-web" {
  listener_arn = aws_lb_listener.sap-web-listener.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.sap-web.arn
  }

  condition {
    host_header {
      values = [var.sap-weburl]
    }
  }
}


resource "aws_lb_listener_rule" "sap-int" {
  listener_arn = aws_lb_listener.sap-web-listener.arn
  priority     = 101

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.sap-int.arn
  }

  condition {
    host_header {
      values = [var.sap-inturl]
    }
  }
}


resource "aws_lb_listener_rule" "po-web" {
  listener_arn = aws_lb_listener.po-web-listener.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.po-web.arn
  }

  condition {
    host_header {
      values = [var.po-weburl]
    }
  }
}


resource "aws_lb_listener_rule" "po-int" {
  listener_arn = aws_lb_listener.po-web-listener.arn
  priority     = 101

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.po-int.arn
  }

  condition {
    host_header {
      values = [var.po-inturl]
    }
  }
}