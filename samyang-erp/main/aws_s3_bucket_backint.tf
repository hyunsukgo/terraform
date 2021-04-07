resource "aws_s3_bucket" "backintbucket" {
  bucket        = "${var.service_name}-backint-bucket"
  force_destroy = true

  tags = {
    Name        = "${var.service_name}-bucket"
    Environment = "Prd"
  }
}