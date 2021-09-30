
resource "aws_security_group" "B4H_PRD_AP" {
  name        = "B4H_PRD_AP"
  description = "B4H_PRD_AP"
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
    description     = "SMTP"
    from_port       = 2500
    to_port         = 2500
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
    description     = "sap dispatcher"
    from_port       = 3200
    to_port         = 3299
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  ingress {
    description     = "sap gateway"
    from_port       = 3300
    to_port         = 3399
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  ingress {
    description     = "sap message server"
    from_port       = 3600
    to_port         = 3699
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
    description     = "abap http"
    from_port       = 8000
    to_port         = 8099
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  ingress {
    description     = "abap https"
    from_port       = 8100
    to_port         = 8199
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  ingress {
          from_port = 0
          to_port = 0
          protocol = -1
          self = true
  }    
/*
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
*/
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "B4H_PRD_AP"
  }
}