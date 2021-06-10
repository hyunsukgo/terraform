
resource "aws_efs_mount_target" "s4h-trans-a" {
  file_system_id = aws_efs_file_system.s4h-trans.id
  subnet_id      = aws_subnet.NAS1_A.id
  security_groups = [aws_security_group.allow_from_trust_to_s4h_trans_efs.id]
  ip_address = "10.200.0.132"
}

resource "aws_efs_mount_target" "s4h-trans-c" {
  file_system_id = aws_efs_file_system.s4h-trans.id
  subnet_id      = aws_subnet.NAS2_C.id
  security_groups = [aws_security_group.allow_from_trust_to_s4h_trans_efs.id]
  ip_address = "10.200.0.172"
}
 

resource "aws_efs_mount_target" "b4h-trans-a" {
  file_system_id = aws_efs_file_system.b4h-trans.id
  subnet_id      = aws_subnet.NAS1_A.id
  security_groups = [aws_security_group.allow_from_trust_to_b4h_trans_efs.id]
  ip_address = "10.200.0.134"
}


resource "aws_efs_mount_target" "b4h-trans-c" {
  file_system_id = aws_efs_file_system.b4h-trans.id
  subnet_id      = aws_subnet.NAS2_C.id
  security_groups = [aws_security_group.allow_from_trust_to_b4h_trans_efs.id]
  ip_address = "10.200.0.174"
}

resource "aws_efs_mount_target" "po-trans-a" {
  file_system_id = aws_efs_file_system.po-trans.id
  subnet_id      = aws_subnet.NAS1_A.id
  security_groups = [aws_security_group.allow_from_trust_to_po_trans_efs.id]
  ip_address = "10.200.0.136"
}

resource "aws_efs_mount_target" "po-trans-c" {
  file_system_id = aws_efs_file_system.po-trans.id
  subnet_id      = aws_subnet.NAS2_C.id
  security_groups = [aws_security_group.allow_from_trust_to_po_trans_efs.id]
  ip_address = "10.200.0.176"
}

resource "aws_efs_mount_target" "sapcd-a" {
  file_system_id = aws_efs_file_system.sapcd.id
  subnet_id      = aws_subnet.NAS1_A.id
  security_groups = [aws_security_group.allow_from_trust_to_sapcd_efs.id]
  ip_address = "10.200.0.130"
}

resource "aws_efs_mount_target" "sapcd-c" {
  file_system_id = aws_efs_file_system.sapcd.id
  subnet_id      = aws_subnet.NAS2_C.id
  security_groups = [aws_security_group.allow_from_trust_to_sapcd_efs.id]
  ip_address = "10.200.0.170"
}