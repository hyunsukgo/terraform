
resource "aws_security_group" "allow_from_trust_to_drawbkap2" {
  name        = "allow_traffic_drawbkap"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc.id
  
  ingress {
    description     = "SMB dialects that communicate over NetBIOS"
    from_port       = 139
    to_port         = 139
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    description     = "newer versions of SMB (after Windows 2000) on top of a TCP stack"
    from_port       = 445
    to_port         = 445
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description     = "RDP from On-Prem"
    from_port       = 3389
    to_port         = 3389
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_from_trust_to_drawbkap"
  }
} 