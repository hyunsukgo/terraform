
resource "aws_security_group" "allow_from_trust_to_firmbkap" {
  name        = "allow_traffic_firmbkap"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc.id
  
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
    description     = "RDP from On-Prem"
    from_port       = 3389
    to_port         = 3389
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "Firm Banking from KSNET"
    from_port       = 9237
    to_port         = 9237
    protocol        = "tcp"
    cidr_blocks     = ["129.200.9.11/32","129.200.9.18/32"]
  }
  ingress {
    description     = "Firm Banking from KSNET"
    from_port       = 9221
    to_port         = 9221
    protocol        = "tcp"
    cidr_blocks     = ["129.200.9.11/32","129.200.9.18/32"]
  }
  ingress {
    description     = "Firm Banking from KSNET"
    from_port       = 21449
    to_port         = 21449
    protocol        = "tcp"
    cidr_blocks     = ["129.200.9.11/32","129.200.9.18/32"]
  }
  ingress {
    description     = "Firm Banking from KSNET"
    from_port       = 28800
    to_port         = 28800
    protocol        = "tcp"
    cidr_blocks     = ["129.200.9.11/32","129.200.9.18/32"]
  }
  ingress {
    description     = "Firm Banking from KSNET"
    from_port       = 50001
    to_port         = 50001
    protocol        = "tcp"
    cidr_blocks     = ["129.200.9.11/32","129.200.9.18/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_from_trust_to_firmbkap"
  }
} 