resource "aws_efs_file_system" "efs" {
  tags = {
    Name = "${var.service_name}-efs"
  }
}
resource "aws_efs_file_system" "saptrans" {
  tags = {
    Name = "${var.service_name}-saptrans-efs"
  }
}