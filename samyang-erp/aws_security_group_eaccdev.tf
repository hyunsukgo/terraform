
resource "aws_security_group" "allow_from_trust_to_eaccap" {
  name        = "allow_traffic_eaccap"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "RDP from On-Prem"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["130.1.0.0/16", "10.200.0.0/16"]
  }
  ingress {
    description = "EACC Web Service"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["130.1.0.0/16", "10.200.0.0/16"]
  }
  ingress {
    description = "EACC Web Service(admin)"
    from_port   = 8082
    to_port     = 8082
    protocol    = "tcp"
    cidr_blocks = ["130.1.0.0/16", "10.200.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_from_trust_to_eaccdev"
  }
} 