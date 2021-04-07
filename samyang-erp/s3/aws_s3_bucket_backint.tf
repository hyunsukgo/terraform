resource "aws_s3_bucket" "backintbucket2" {
  bucket        = "${var.service_name}-backint-bucket2"
  force_destroy = true

  tags = {
    Name        = "${var.service_name}-bucket2"
    Environment = "Prd"
  }
}