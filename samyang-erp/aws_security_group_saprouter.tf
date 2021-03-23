
resource "aws_security_group" "allow_from_trust_to_saprouter" {
  name        = "allow_traffic_saprouter"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "SSH from On-Prem"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["130.1.0.0/16"]
    prefix_list_ids = [aws_ec2_managed_prefix_list.aempl.id]
  }
  ingress {
    description = "SapRouter Access"
    from_port   = 3200
    to_port     = 3399
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SapRouter Access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_from_trust_to_saprouter"
  }
} 