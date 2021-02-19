resource "aws_efs_access_point" "efs_access_point" {
  file_system_id = aws_efs_file_system.efs.id

  tags = {
    Name = "${local.service_name}-efs-access-point"
  }
}