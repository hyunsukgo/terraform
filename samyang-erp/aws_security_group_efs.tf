/*resource "aws_security_group" "allow_from_trust_to_s4h_trans_efs" {
  name        = "s4h-trans allow_traffic_efs"
  description = "Allow NFS inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "S4H NFS"
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
    security_groups = [aws_security_group.S4H_PRD_AP.id, aws_security_group.S4H_DEV_QAS_AP.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_from_trust_to_s4h-trans_efs"
  }
}

resource "aws_security_group" "allow_from_trust_to_b4h_trans_efs" {
  name        = "b4h-trans allow_traffic_efs"
  description = "Allow NFS inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "B4H NFS"
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
    security_groups = [aws_security_group.B4H_PRD_AP.id, aws_security_group.B4H_DEV_AP.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_from_trust_to_b4h_trans_efs"
  }
}


resource "aws_security_group" "allow_from_trust_to_po_trans_efs" {
  name        = "po-trans allow_traffic_efs"
  description = "Allow NFS inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "PO Trans NFS"
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
    security_groups = [aws_security_group.PO_PRD_AP.id, aws_security_group.PO_DEV_QAS_AP.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_from_trust_to_po_trans_efs"
  }
}

*/