resource "aws_backup_vault" "backup" {
  name        = "${local.service_name}_backup_vault"
  kms_key_arn = aws_kms_key.backup.arn
}

resource "aws_backup_plan" "backup_plan" {
  name = "${local.service_name}_backup_plan"

  rule {
    rule_name         = "${local.service_name}_example_backup_rule"
    target_vault_name = aws_backup_vault.backup.name
    schedule          = "cron(0 12 * * ? *)"
  }

  advanced_backup_setting {
    backup_options = {
      WindowsVSS = "enabled"
    }
    resource_type = "EC2"
  }
}