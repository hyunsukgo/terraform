resource "aws_accessanalyzer_analyzer" "iam-access-analyzer" {
  analyzer_name = "${var.service_name}-access"
}