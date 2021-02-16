resource "aws_s3_bucket" "cloudtrailucket" {
  bucket = "${local.service_name}-cloudtrail-bucket"
  acl    = "log-delivery-write"

  tags = {
    Name        = "${local.service_name}-bucket"
    Environment = "Prd"
  }
}