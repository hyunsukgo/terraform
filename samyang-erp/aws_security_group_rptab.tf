
resource "aws_security_group" "allow_from_trust_to_rptab" {
  name        = "allow_traffic_rptap"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "Access for RDP"
    from_port       = 3389
    to_port         = 3389
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
    cidr_blocks     = ["172.16.16.0/24"]
  }

  ingress {
    description     = "Access from ALB (HTTP)"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.allow_from_trust_to_report_alb.id]
    cidr_blocks     = ["172.16.16.0/24", "130.1.0.0/16"]
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
    description = "OZ Report Schduling"
    from_port   = 9521
    to_port     = 9521
    protocol    = "tcp"
    cidr_blocks = ["130.1.0.0/16"]
  }

  ingress {
    description     = "SECUVE"
    from_port       = 53000
    to_port         = 53008
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["10.20.0.0/16", "130.1.0.0/16"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "LEG_rptap"
  }
} 