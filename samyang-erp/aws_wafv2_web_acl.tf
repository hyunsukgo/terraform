resource "aws_wafv2_web_acl" "web_acl" {
  name        = "${var.service_name}_web_acl"
  description = "${var.service_name}_web_acl"
  scope       = "REGIONAL"

  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "${var.service_name}-waf-metric"
    sampled_requests_enabled   = false
  }
}

resource "aws_wafv2_web_acl_association" "web_acl_assoc" {
  resource_arn = aws_lb.reportlb.arn
  web_acl_arn  = aws_wafv2_web_acl.web_acl.arn
}

resource "aws_kinesis_firehose_delivery_stream" "extended_s3_stream" {
  name        = "terraform-kinesis-firehose-extended-s3-waf-stream"
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn   = aws_iam_role.firehose_role.arn
    bucket_arn = aws_s3_bucket.waf.arn

    processing_configuration {
      enabled = "true"

      }
    }
  }
}

resource "aws_iam_role" "firehose_role" {
  name = "firehose_test_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "firehose.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_wafv2_web_acl_logging_configuration" "extended_s3_stream" {
  log_destination_configs = [aws_kinesis_firehose_delivery_stream.extended_s3_stream.arn]
  resource_arn            = aws_wafv2_web_acl.web_acl.arn
  
}