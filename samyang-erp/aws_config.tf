resource "aws_config_aggregate_authorization" "config" {
  account_id = local.account_id
  region     = aws.region
}