resource "aws_s3_bucket" "backupbucket" {
  bucket        = "${var.service_name}-backup-bucket"
  force_destroy = true

  tags = {
    Name        = "${var.service_name}-backup-bucket"
    Environment = "Prd"
  }
  lifecycle_rule {
    id      = "SY-bucket-LR"
    enabled = true

    expiration {
      days = 5
      expired_object_delete_marker = false
    }
  }
}