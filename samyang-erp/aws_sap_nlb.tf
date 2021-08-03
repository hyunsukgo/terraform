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