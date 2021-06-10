resource "aws_security_group" "allow_from_trust_to_s4h_trans_efs" {
  name        = "s4h-trans allow_traffic_efs"
  description = "Allow NFS inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "S4H NFS"
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    security_groups = [aws_security_group.allow_from_trust_to_seqap.id,aws_security_group.allow_from_trust_to_ap.id]
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
    security_groups = [aws_security_group.allow_from_trust_to_bw_ap.id]
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
    security_groups = [aws_security_group.allow_from_trust_to_spqap.id,aws_security_group.allow_from_trust_to_po.id,aws_security_group.allow_from_trust_to_spqap.id,aws_security_group.allow_from_trust_to_spqdb.id,aws_security_group.allow_from_trust_to_seqap.id,aws_security_group.allow_from_trust_to_seqdb.id,aws_security_group.allow_from_trust_to_ap.id,aws_security_group.allow_from_trust_to_db.id,aws_security_group.allow_from_trust_to_po.id]
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

resource "aws_security_group" "allow_from_trust_to_sapcd_efs" {
  name        = "sapcd allow_traffic_efs"
  description = "Allow NFS inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "sbdap NFS"
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    security_groups = [aws_security_group.allow_from_trust_to_bw_ap.id,aws_security_group.allow_from_trust_to_bw_db.id]
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