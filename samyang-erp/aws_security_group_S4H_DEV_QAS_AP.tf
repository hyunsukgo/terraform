
resource "aws_security_group" "S4H_DEV_QAS_AP" {
  name        = "S4H_DEV_QAS_AP"
  description = "S4H_DEV_QAS_AP"
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
    description     = "SMTP"
    from_port       = 2500
    to_port         = 2500
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
    description     = "sap dispatcher"
    from_port       = 3200
    to_port         = 3299
    protocol        = "tcp"
    self            = true
  }

  ingress {
    description     = "sap gateway"
    from_port       = 3300
    to_port         = 3399
    protocol        = "tcp"
    self            = true
  }

  ingress {
    description     = "sap message server"
    from_port       = 3600
    to_port         = 3699
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
    description     = "abap http"
    from_port       = 8000
    to_port         = 8099
    protocol        = "tcp"
    self            = true
  }

  ingress {
    description     = "abap https"
    from_port       = 8100
    to_port         = 8199
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
    Name = "S4H_DEV_QAS_AP"
  }
} 