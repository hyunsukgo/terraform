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

resource "aws_lb_target_group_attachment" "ascs_msg_server" {
  target_group_arn = aws_lb_target_group.ascs_msg_server.arn
  target_id        = "10.150.220.10"
  port             = 3610
}

resource "aws_lb_target_group_attachment" "sap_start" {
  target_group_arn = aws_lb_target_group.sap_start.arn
  target_id        = "10.150.110.10"
  port             = 50013
}


resource "aws_lb_target_group_attachment" "jdbc_port" {
  target_group_arn = aws_lb_target_group.jdbc_port.arn
  target_id        = "10.150.110.10"
  port             = 30015
}


resource "aws_lb_target_group_attachment" "sap_hana" {
  target_group_arn = aws_lb_target_group.sap_hana.arn
  target_id        = "10.150.110.10"
  port             = 30013
}