
resource "aws_security_group" "allow_from_trust_to_casap" {
  name        = "allow_traffic_casapap"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "Access for RDP"
    from_port       = 3389
    to_port         = 3389
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  ingress {
    description     = ""
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  ingress {
    description     = "SECUVE"
    from_port       = 53000
    to_port         = 53008
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
    Name = "LEG_casap"
  }
} 