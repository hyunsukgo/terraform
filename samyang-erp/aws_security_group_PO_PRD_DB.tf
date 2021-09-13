
resource "aws_security_group" "PO_PRD_DB" {
  name        = "PO_PRD_DB"
  description = "PO_PRD_DB"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "SSH"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  ingress {
    description     = "NFS"
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  ingress {
    description     = "saphostagent"
    from_port       = 1128
    to_port         = 1129
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  ingress {
    description     = "sapinst"
    from_port       = 4237
    to_port         = 4238
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  ingress {
    description     = "SAP HANA AP"
    from_port       = 30000
    to_port         = 39999
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  ingress {
    description     = "sap start service"
    from_port       = 50013
    to_port         = 59914
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
    Name = "PO_PRD_DB"
  }
}