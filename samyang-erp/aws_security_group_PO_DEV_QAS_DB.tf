
resource "aws_security_group" "PO_PRD_AP" {
  name        = "PO_PRD_AP"
  description = "PO_PRD_AP"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "SSH"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    self            = true
  }

  ingress {
    description     = "NFS"
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    self            = true
  }

  ingress {
    description     = "saphostagent"
    from_port       = 1128
    to_port         = 1129
    protocol        = "tcp"
    self            = true
  }

  ingress {
    description     = "sapinst"
    from_port       = 4237
    to_port         = 4238
    protocol        = "tcp"
    self            = true
  }

  ingress {
    description     = "SAP HANA AP"
    from_port       = 30000
    to_port         = 39999
    protocol        = "tcp"
    self            = true
  }

  ingress {
    description     = "sap start service"
    from_port       = 50013
    to_port         = 59914
    protocol        = "tcp"
    self            = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "PO_DEV_QAS_DB"
  }
}