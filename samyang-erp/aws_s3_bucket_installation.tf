resource "aws_s3_bucket" "installationbucket" {
  bucket        = "${var.service_name}-installation-bucket"
  force_destroy = true

  tags = {
    Name        = "${var.service_name}-installation-bucket"
    Environment = "Prd"
  }
}

resource "aws_s3_bucket" "launchwizard" {
  bucket        = "${var.service_name}-launchwizard-bucket"
  force_destroy = true

  tags = {
    Name        = "${var.service_name}-launchwizard-bucket"
    Environment = "Prd"
  }
}