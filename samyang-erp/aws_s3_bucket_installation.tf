resource "aws_s3_bucket" "installationbucket" {
  bucket        = "${var.service_name}-installation-bucket"
  force_destroy = true

  tags = {
    Name        = "${var.service_name}-installation-bucket"
    Environment = "Prd"
  }
}