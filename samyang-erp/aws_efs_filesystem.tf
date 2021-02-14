resource "aws_efs_file_system" "efs" {
  tags = {
    Name = "${local.service_name}-efs"
  }
}