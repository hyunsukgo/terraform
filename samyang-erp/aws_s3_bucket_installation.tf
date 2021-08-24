
resource "aws_s3_bucket" "lw" {
  bucket        = "launchwizard-${var.service_name}-bucket"
  force_destroy = true

  tags = {
    Name        = "launchwizard-${var.service_name}-bucket"
    Environment = "Prd"
  }
}