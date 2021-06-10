resource "aws_efs_file_system" "efs" {
  tags = {
    Name = "${var.service_name}-efs"
  }
}
resource "aws_efs_file_system" "s4h" {
  tags = {
    Name = "${var.service_name}-s4h-efs"
  }
}

resource "aws_efs_file_system" "bo" {
  tags = {
    Name = "${var.service_name}-bo-efs"
  }
}

resource "aws_efs_file_system" "po" {
  tags = {
    Name = "${var.service_name}-po-efs"
  }
}