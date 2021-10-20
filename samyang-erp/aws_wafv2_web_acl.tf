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