
resource "aws_security_group" "SAPROUTER" {
  name        = "SAPROUTER"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description = "SapRouter Access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["3.36.176.77/32"]
  }

  ingress {
    description = "SapRouter Access"
    from_port   = 3200
    to_port     = 3299
    protocol    = "tcp"
    cidr_blocks = ["3.36.176.77/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SAPROUTER"
  }
} 