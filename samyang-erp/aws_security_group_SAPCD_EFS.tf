
resource "aws_security_group" "SAPCD_EFS" {
  name        = "SAPCD_EFS"
  description = "SAPCD_EFS"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "S4H NFS"
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    #prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
    security_groups = [aws_security_group.S4H_DEV_QAS_AP.id, aws_security_group.S4H_PRD_AP.id, aws_security_group.S4H_DEV_QAS_DB.id, aws_security_group.S4H_PRD_DB.id, aws_security_group.B4H_DEV_AP.id, aws_security_group.B4H_DEV_DB.id, aws_security_group.B4H_PRD_AP.id, aws_security_group.B4H_PRD_DB.id, aws_security_group.PO_DEV_QAS_AP.id, aws_security_group.PO_DEV_QAS_DB.id, aws_security_group.PO_PRD_AP.id, aws_security_group.PO_PRD_DB.id, aws_security_group.SAPROUTER.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SAPCD_EFS"
  }
}