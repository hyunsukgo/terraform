resource "aws_s3_bucket" "installationbucket" {
  bucket        = "${var.service_name}-installation-bucket"
  force_destroy = true

  tags = {
    Name        = "${var.service_name}-installation-bucket"
    Environment = "Prd"
  }
}

resource "aws_s3_bucket" "launchwizard" {
  bucket        = "launchwizard-${var.service_name}-bucket"
  force_destroy = true

  tags = {
    Name        = "launchwizard-${var.service_name}-bucket"
    Environment = "Prd"
  }
}