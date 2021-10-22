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

  rule {
    name     = "AWS-AWSManagedRulesAdminProtectionRuleSet"
    priority = 6
    override_action {

    }
    statement {
      managed_rule_group_statement {
        name        = "AWSAWSManagedRulesAdminProtectionRuleSet"
        vendor_name = "AWS"
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWS-AWSManagedRulesAdminProtectionRuleSet"
      sampled_requests_enabled   = true
    }
  }

  rule {
    name     = "AWS-AWSManagedRulesAmazonIpReputationList"
    priority = 5
    override_action {

    }
    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesAmazonIpReputationList"
        vendor_name = "AWS"
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWS-AWSManagedRulesAmazonIpReputationList"
      sampled_requests_enabled   = true
    }
  }

  rule {
    name     = "AWS-AWSManagedRulesAnonymousIpList"
    priority = 4
    override_action {}
    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesAnonymousIpList"
        vendor_name = "AWS"
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWS-AWSManagedRulesAnonymousIpList"
      sampled_requests_enabled   = true
    }
  }

  rule {
    name     = "AWS-AWSManagedRulesCommonRuleSet"
    priority = 3
    override_action {}
    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
        excluded_rule {
          name = "CrossSiteScripting_BODY"
        }

        excluded_rule {
          name = "CrossSiteScripting_COOKIE"
        }

        excluded_rule {
          name = "CrossSiteScripting_QUERYARGUMENTS"
        }

        excluded_rule {
          name = "CrossSiteScripting_URIPATH"
        }

        excluded_rule {
          name = "EC2MetaDataSSRF_BODY"
        }

        excluded_rule {
          name = "EC2MetaDataSSRF_COOKIE"
        }

        excluded_rule {
          name = "EC2MetaDataSSRF_QUERYARGUMENTS"
        }

        excluded_rule {
          name = "EC2MetaDataSSRF_URIPATH"
        }

        excluded_rule {
          name = "GenericLFI_BODY"
        }

        excluded_rule {
          name = "GenericLFI_QUERYARGUMENTS"
        }

        excluded_rule {
          name = "GenericLFI_URIPATH"
        }

        excluded_rule {
          name = "GenericRFI_BODY"
        }

        excluded_rule {
          name = "GenericRFI_QUERYARGUMENTS"
        }

        excluded_rule {
          name = "GenericRFI_URIPATH"
        }

        excluded_rule {
          name = "NoUserAgent_HEADER"
        }

        excluded_rule {
          name = "RestrictedExtensions_QUERYARGUMENTS"
        }

        excluded_rule {
          name = "RestrictedExtensions_URIPATH"
        }

        excluded_rule {
          name = "SizeRestrictions_BODY"
        }

        excluded_rule {
          name = "SizeRestrictions_QUERYSTRING"
        }

        excluded_rule {
          name = "SizeRestrictions_URIPATH"
        }

        excluded_rule {
          name = "UserAgent_BadBots_HEADER"
        }
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWS-AWSManagedRulesCommonRuleSet"
      sampled_requests_enabled   = true
    }
  }

  rule {
    name     = "AWS-AWSManagedRulesSQLiRuleSet"
    priority = 2
    override_action {}
    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesSQLiRuleSet"
        vendor_name = "AWS"
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWS-AWSManagedRulesSQLiRuleSet"
      sampled_requests_enabled   = true
    }
  }

  rule {
    name     = "AWS-AWSManagedRulesLinuxRuleSet"
    priority = 1
    override_action {}
    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesLinuxRuleSet"
        vendor_name = "AWS"
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWS-AWSManagedRulesLinuxRuleSet"
      sampled_requests_enabled   = true
    }
  }
}

resource "aws_wafv2_web_acl_association" "web_acl_assoc" {
  resource_arn = aws_lb.reportlb.arn
  web_acl_arn  = aws_wafv2_web_acl.web_acl.arn
}

resource "aws_kinesis_firehose_delivery_stream" "extended_s3_stream" {
  name        = "aws-waf-logs-kinesis-firehose-extended-s3-waf-stream"
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn   = aws_iam_role.firehose_role.arn
    bucket_arn = aws_s3_bucket.waf.arn
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
  logging_filter {
    default_behavior = "KEEP"

    filter {
      behavior = "DROP"

      condition {
        action_condition {
          action = "COUNT"
        }
      }

      requirement = "MEETS_ALL"
    }

    filter {
      behavior = "KEEP"

      condition {
        action_condition {
          action = "ALLOW"
        }
      }

      requirement = "MEETS_ANY"
    }
  }
  redacted_fields {
    single_header {
      name = "user-agent"
    }
  }
}
