resource "aws_efs_file_system" "s4h-trans" {
  tags = {
    Name     = "${var.service_name}-s4h-trans-efs"
    Snapshot = "Yes"
  }
}
resource "aws_efs_file_system" "b4h-trans" {
  tags = {
    Name     = "${var.service_name}-b4h-trans-efs"
    Snapshot = "Yes"
  }
}

resource "aws_efs_file_system" "po-trans" {
  tags = {
    Name     = "${var.service_name}-po-trans-efs"
    Snapshot = "Yes"
  }
}

resource "aws_efs_file_system" "sapcd" {
  tags = {
    Name     = "${var.service_name}-sapcd-efs"
    Snapshot = "Yes"
  }
}
/*
resource "aws_efs_file_system" "po-mnt-qas" {
  tags = {
    Name = "${var.service_name}-po-mnt-qas-efs"
    Snapshot    = "Yes"
  }
}
*/