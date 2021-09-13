
resource "aws_security_group" "BO_PRD" {
  name        = "BO_PRD"
  description = "BO_PRD"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "SMB dialects taht communicate over NetBIOS"
    from_port       = 139
    to_port         = 139
    protocol        = "tcp"
    self            = true
  }

  ingress {
    description     = "newer version of SMB"
    from_port       = 445
    to_port         = 445
    protocol        = "tcp"
    self            = true
  }

  ingress {
    description     = "MS SQL"
    from_port       = 1433
    to_port         = 1433
    protocol        = "tcp"
    self            = true
  }

  ingress {
    description     = "RDP"
    from_port       = 3389
    to_port         = 3389
    protocol        = "tcp"
    self            = true
  }

  ingress {
    description     = "BO Service"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    self            = true
  }

  ingress {
    description     = "CMS Service"
    from_port       = 6400
    to_port         = 6499
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
    Name = "BO_PRD"
  }
}