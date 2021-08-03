resource "aws_lb_target_group" "ascs_msg_server" {
  name        = "ASCS-Message-server-port"
  port        = 3610
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = aws_vpc.vpc.id
}

resource "aws_lb_target_group" "sap_start" {
  name        = "SAPStartSrv-HTTPPort"
  port        = 50013
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = aws_vpc.vpc.id
}

resource "aws_lb_target_group" "jdbc_port" {
  name        = "JDBC-SQL-Port"
  port        = 30015
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = aws_vpc.vpc.id
}

resource "aws_lb_target_group" "sap_hana" {
  name        = "SAP-HANA"
  port        = 30013
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = aws_vpc.vpc.id
}

resource "aws_lb" "sep_nlb" {
  name               = "samyang-sep-lb"
  internal           = true
  load_balancer_type = "network"
  subnets            = [aws_subnet.SAPAP1_A.id, aws_subnet.SAPAP2_C.id]

  enable_deletion_protection = true

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "ascs_msg_server" {
  load_balancer_arn = aws_lb.sep_nlb.arn
  port              = "3610"
  protocol          = "TCP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ascs_msg_server.arn
  }
}



resource "aws_lb_listener" "jdbc_port" {
  load_balancer_arn = aws_lb.sep_nlb.arn
  port              = "30015"
  protocol          = "TCP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.jdbc_port.arn
  }
}


resource "aws_lb_listener" "sap_hana" {
  load_balancer_arn = aws_lb.sep_nlb.arn
  port              = "30013"
  protocol          = "TCP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.sap_hana.arn
  }
}