resource "aws_backup_vault" "backup" {
  name        = "${local.service_name}-backup-vault"
  kms_key_arn = aws_kms_key.backup.arn
}

resource "aws_backup_plan" "backupplan" {
  name = "${local.service_name}-backup-plan"

  rule {
    rule_name         = "${local.service_name}_example_backup_rule"
    target_vault_name = aws_backup_vault.backup.name
    schedule          = "cron(0 20 * * ? *)"
    lifecycle {
        cold_storage_after = 0
        delete_after       = 1
    }
  }

  advanced_backup_setting {
    backup_options = {
      WindowsVSS = "enabled"
    }
    resource_type = "EC2"
  }
}