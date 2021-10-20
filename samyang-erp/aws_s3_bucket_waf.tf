resource "aws_s3_bucket" "waf" {
  bucket        = "${var.service_name}-waf-bucket"
  force_destroy = true

  tags = {
    Name        = "${var.service_name}-waf-bucket"
    Environment = "Prd"
  }
}