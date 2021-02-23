resource "aws_s3_bucket" "backintbucket" {
  bucket        = "${local.service_name}-backint-bucket"
  force_destroy = true

  tags = {
    Name        = "${local.service_name}-bucket"
    Environment = "Prd"
  }
}