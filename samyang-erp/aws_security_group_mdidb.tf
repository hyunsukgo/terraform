
resource "aws_security_group" "allow_from_trust_to_mdidb" {
  name        = "allow_traffic_mdidb"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "Service Port"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  ingress {
    description     = "Ddeveloping for MDI"
    from_port       = 8070
    to_port         = 8070
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  ingress {
    description     = "Application Port"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  ingress {
    description     = "Application Port(Admin)"
    from_port       = 8090
    to_port         = 8090
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description = "Samyang-Azure"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["10.20.0.0/16"]
  }
  ingress {
    description = "Samyang-Azure"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.20.0.0/16"]
  }
  ingress {
    description     = "SMB dialects that communicate over NetBIOS"
    from_port       = 139
    to_port         = 139
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "newer versions of SMB (after Windows 2000) on top of a TCP stack"
    from_port       = 445
    to_port         = 445
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
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

  ingress {
    description     = "DBSAFER"
    from_port       = 21113
    to_port         = 21114
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  ingress {
    description     = "DBSAFER"
    from_port       = 21113
    to_port         = 21114
    protocol        = "udp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  ingress {
    description     = "DBSAFER"
    from_port       = 3139
    to_port         = 3141
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  ingress {
    description     = "DBSAFER"
    from_port       = 3139
    to_port         = 3141
    protocol        = "udp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  ingress {
    description     = "DBSAFER"
    from_port       = 4000
    to_port         = 4999
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

  ingress {
    description     = "Vormetric"
    from_port       = 7024
    to_port         = 7024
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  ingress {
    description     = "Test"
    from_port       = -1
    to_port         = -1
    protocol        = "icmp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "LEG_mdidb"
  }
} 