resource "aws_efs_access_point" "s4h_trans_access_point" {
  file_system_id = aws_efs_file_system.s4h-trans.id

  tags = {
    Name = "${var.service_name}-efs-access-point"
  }
}

resource "aws_efs_access_point" "b4h_trans_access_point" {
  file_system_id = aws_efs_file_system.b4h-trans.id

  tags = {
    Name = "${var.service_name}-s4h-access-point"
  }
}

resource "aws_efs_access_point" "po_access_point" {
  file_system_id = aws_efs_file_system.po-trans.id

  tags = {
    Name = "${var.service_name}-bo-access-point"
  }
}

resource "aws_efs_access_point" "sapcd_access_point" {
  file_system_id = aws_efs_file_system.sapcd.id

  tags = {
    Name = "${var.service_name}-po-access-point"
  }
}
/*
resource "aws_efs_access_point" "po_mnt_qas_access_point" {
  file_system_id = aws_efs_file_system.po-mnt-qas.id

  tags = {
    Name = "${var.service_name}-po-mnt-qas-access-point"
  }
}
*/