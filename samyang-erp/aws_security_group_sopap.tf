
resource "aws_security_group" "allow_from_trust_to_sopap" {
  name        = "allow_traffic_sopap"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc.id


  ingress {
    description     = "Http"
    from_port       = 80
    to_port         = 80
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
    description     = "Application"
    from_port       = 5000
    to_port         = 5000
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
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
    description     = "RDP from On-Prem"
    from_port       = 3389
    to_port         = 3389
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
    Name = "LEG_sopap"
  }
} #