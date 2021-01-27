resource "aws_s3_bucket" "etl_bucket" {
  bucket = "${local.service_name}-data-source"
  acl    = "private"

  tags = {
    Name        = "${local.service_name}-data-source"
    Environment = "prd"
  }
}