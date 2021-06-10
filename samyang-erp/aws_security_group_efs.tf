resource "aws_security_group" "allow_from_trust_to_efs" {
  name        = "allow_traffic_efs"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "seqdb NFS"
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
    security_groups = [aws_security_group.allow_from_trust_to_bw_ap.id,aws_security_group.allow_from_trust_to_bw_db.id,aws_security_group.allow_from_trust_to_seqap.id,aws_security_group.allow_from_trust_to_seqdb.id,aws_security_group.allow_from_trust_to_spqap.id,aws_security_group.allow_from_trust_to_spqdb.id,aws_security_group.allow_from_trust_to_ap.id,aws_security_group.allow_from_trust_to_db.id,aws_security_group.allow_from_trust_to_po.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_from_trust_to_efs"
  }
}
