resource "aws_efs_file_system" "efs" {
  tags = {
    Name = "${var.service_name}-efs"
  }
}