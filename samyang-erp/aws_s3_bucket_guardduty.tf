resource "aws_s3_bucket" "guardduty" {
  bucket        = "${var.service_name}-guardduty-bucket"
  force_destroy = true

  tags = {
    Name        = "${var.service_name}-guardduty-bucket"
    Environment = "Prd"
  }
}