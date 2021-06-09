resource "aws_efs_access_point" "efs_access_point" {
  file_system_id = aws_efs_file_system.efs.id

  tags = {
    Name = "${var.service_name}-efs-access-point"
  }
}

resource "aws_efs_access_point" "saptrans_access_point" {
  file_system_id = aws_efs_file_system.saptrans.id

  tags = {
    Name = "${var.service_name}-saptrans-access-point"
  }
}