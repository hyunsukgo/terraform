resource "aws_efs_access_point" "efs_access_point" {
  file_system_id = aws_efs_file_system.efs.id

  tags = {
    Name = "${var.service_name}-efs-access-point"
  }
}

resource "aws_efs_access_point" "s4h_access_point" {
  file_system_id = aws_efs_file_system.s4h.id

  tags = {
    Name = "${var.service_name}-s4h-access-point"
  }
}

resource "aws_efs_access_point" "bo_access_point" {
  file_system_id = aws_efs_file_system.bo.id

  tags = {
    Name = "${var.service_name}-bo-access-point"
  }
}

resource "aws_efs_access_point" "po_access_point" {
  file_system_id = aws_efs_file_system.po.id

  tags = {
    Name = "${var.service_name}-po-access-point"
  }
}