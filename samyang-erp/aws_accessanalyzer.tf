resource "aws_accessanalyzer_analyzer" "iam-access-analyzer" {
  analyzer_name = "${local.service_name}-access"
}