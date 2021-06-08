
resource "aws_security_group" "allow_from_trust_to_ifmdb" {
  name        = "allow_traffic_ifmdb"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "SSH from Trusted Zone"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "HTTP from Trusted Zone"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "HTTPS from Trusted Zone"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "Application from Trusted Zone"
    from_port       = 8000
    to_port         = 8199
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "PostgreSQL Access from On-Prem"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "EAI Monitoring"
    from_port       = 9840
    to_port         = 9841
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
    Name = "allow_from_trust_to_ifmdb"
  }
} 