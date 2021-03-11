resource "aws_s3_bucket" "backupbucket" {
  bucket        = "${var.service_name}-backup-bucket"
  force_destroy = true

  tags = {
    Name        = "${var.service_name}-backup-bucket"
    Environment = "Prd"
  }
}