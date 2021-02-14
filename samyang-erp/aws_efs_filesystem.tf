resource "aws_efs_file_system" "foo" {
  tags = {
    Name = "${local.service_name}-efs"
  }
}