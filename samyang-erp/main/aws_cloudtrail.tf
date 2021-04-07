resource "aws_cloudtrail" "cloudtrail" {
  name                          = "${var.service_name}-trail"
  s3_bucket_name                = aws_s3_bucket.cloudtrailucket.id
  s3_key_prefix                 = "prefix"
  include_global_service_events = false
}