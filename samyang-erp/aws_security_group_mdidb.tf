
resource "aws_security_group" "allow_from_trust_to_mdidb" {
  name        = "allow_traffic_mdidb"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "MSSQL Access from On-Prem"
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = ["130.1.0.0/16", "10.200.0.0/16"]
  }

  ingress {
    description = "RDP from On-Prem"
    from_port   = 3389
    to_port     = 3389
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
    Name = "allow_from_trust_to_mdidb"
  }
} 