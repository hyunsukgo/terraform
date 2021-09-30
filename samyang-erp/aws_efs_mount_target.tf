
resource "aws_efs_mount_target" "s4h-trans-a" {
  file_system_id  = aws_efs_file_system.s4h-trans.id
  subnet_id       = aws_subnet.NAS1_A.id
  security_groups = [aws_security_group.S4H_DEV_QAS_AP.id ,aws_security_group.S4H_PRD_AP.id]
  ip_address      = "10.200.0.132"
}

resource "aws_efs_mount_target" "s4h-trans-c" {
  file_system_id  = aws_efs_file_system.s4h-trans.id
  subnet_id       = aws_subnet.NAS2_C.id
  security_groups = [aws_security_group.S4H_DEV_QAS_AP.id ,aws_security_group.S4H_PRD_AP.id]
  ip_address      = "10.200.0.172"
}


resource "aws_efs_mount_target" "b4h-trans-a" {
  file_system_id  = aws_efs_file_system.b4h-trans.id
  subnet_id       = aws_subnet.NAS1_A.id
  security_groups = [aws_security_group.B4H_DEV_AP.id ,aws_security_group.B4H_PRD_AP.id]
  ip_address      = "10.200.0.134"
}


resource "aws_efs_mount_target" "b4h-trans-c" {
  file_system_id  = aws_efs_file_system.b4h-trans.id
  subnet_id       = aws_subnet.NAS2_C.id
  security_groups = [aws_security_group.B4H_DEV_AP.id ,aws_security_group.B4H_PRD_AP.id]
  ip_address      = "10.200.0.174"
}

resource "aws_efs_mount_target" "po-trans-a" {
  file_system_id  = aws_efs_file_system.po-trans.id
  subnet_id       = aws_subnet.NAS1_A.id
  security_groups = [aws_security_group.PO_DEV_QAS_AP.id ,aws_security_group.PO_PRD_AP.id]
  ip_address      = "10.200.0.136"
}

resource "aws_efs_mount_target" "po-trans-c" {
  file_system_id  = aws_efs_file_system.po-trans.id
  subnet_id       = aws_subnet.NAS2_C.id
  security_groups = [aws_security_group.PO_DEV_QAS_AP.id ,aws_security_group.PO_PRD_AP.id]
  ip_address      = "10.200.0.176"
}

resource "aws_efs_mount_target" "sapcd-a" {
  file_system_id  = aws_efs_file_system.sapcd.id
  subnet_id       = aws_subnet.NAS1_A.id
  security_groups = [aws_security_group.SAPCD_EFS.id]
  ip_address      = "10.200.0.139"
}

resource "aws_efs_mount_target" "sapcd-c" {
  file_system_id  = aws_efs_file_system.sapcd.id
  subnet_id       = aws_subnet.NAS2_C.id
  security_groups = [aws_security_group.SAPCD_EFS.id]
  ip_address      = "10.200.0.179"
}
/*
resource "aws_efs_mount_target" "po-mnt-qas-a" {
  file_system_id  = aws_efs_file_system.po-mnt-qas.id
  subnet_id       = aws_subnet.NAS1_A.id
  security_groups = [aws_security_group.allow_from_trust_to_po_mnt_qas_efs.id]
  ip_address      = "10.200.0.137"
}

resource "aws_efs_mount_target" "po-mnt-qas-c" {
  file_system_id  = aws_efs_file_system.po-mnt-qas.id
  subnet_id       = aws_subnet.NAS2_C.id
  security_groups = [aws_security_group.allow_from_trust_to_po_mnt_qas_efs.id]
  ip_address      = "10.200.0.177"
}
*/