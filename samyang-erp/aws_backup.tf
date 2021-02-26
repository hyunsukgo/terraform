resource "aws_backup_vault" "backup" {
  name        = "${local.service_name}-backup-vault"
  kms_key_arn = aws_kms_key.backup.arn
}

resource "aws_backup_plan" "backupplan" {
  name = "${local.service_name}-backup-plan"

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

resource "aws_iam_role" "backuprole" {
  name               = "${local.service_name}-backup-role"
  assume_role_policy = jsonencode({
    Version: "2012-10-17",
    Statement: [
      {
        Sid = "default",
        Effect = "Allow",
        Principal = {
          Service = "backup.amazonaws.com"
        },
        Action = [
          "backup:DescribeBackupVault",
          "backup:DeleteBackupVault",
          "backup:PutBackupVaultAccessPolicy",
          "backup:DeleteBackupVaultAccessPolicy",
          "backup:GetBackupVaultAccessPolicy",
          "backup:StartBackupJob",
          "backup:GetBackupVaultNotifications",
          "backup:PutBackupVaultNotifications"
        ],
        Resource = aws_backup_vault.backup.arn
      }
    ]
  })
}
resource "aws_backup_selection" "backselection" {
  iam_role_arn = aws_iam_role.backuprole.arn
  name         = "${local.service_name}-selection"
  plan_id      = aws_backup_plan.backupplan.id

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "foo"
    value = "bar"
  }
}