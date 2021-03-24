
resource "aws_security_group" "allow_from_trust_to_mdidb" {
  name        = "allow_traffic_mdidb"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "MSSQL Access from On-Prem"
    from_port       = 1433
    to_port         = 1433
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  ingress {
    description     = "RDP from On-Prem"
    from_port       = 3389
    to_port         = 3389
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
    Name = "allow_from_trust_to_mdidb"
  }
} 