resource "aws_s3_bucket" "backupbucket" {
  bucket        = "${local.service_name}-backup-bucket"
  force_destroy = true

  tags = {
    Name        = "${local.service_name}-backup-bucket"
    Environment = "Prd"
  }
}