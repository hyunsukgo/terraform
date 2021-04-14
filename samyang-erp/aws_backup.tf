resource "aws_backup_vault" "backup" {
  name        = "${var.service_name}-backup-vault"
  kms_key_arn = aws_kms_key.backup.arn
}
resource "aws_backup_plan" "rds_backupplan" {
  name = "${var.service_name}-rds-backup-plan"

  rule {
    rule_name         = "${var.service_name}_rds_backup_rule"
    target_vault_name = aws_backup_vault.backup.name
    schedule          = "cron(0 20 * * ? *)"

    lifecycle {
      cold_storage_after = 0
      delete_after       = 1
    }

  }
}
resource "aws_backup_plan" "backupplan" {
  name = "${var.service_name}-backup-plan"

  rule {
    rule_name         = "${var.service_name}_backup_rule"
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

resource "aws_iam_role" "awsbackuprole" {
  name               = "${var.service_name}-backup-role"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": ["sts:AssumeRole"],
      "Effect": "allow",
      "Principal": {
        "Service": ["backup.amazonaws.com"]
      }
    }
  ]
}
POLICY
}
resource "aws_iam_role_policy_attachment" "awsbackup" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
  role       = aws_iam_role.awsbackuprole.name
}


resource "aws_backup_selection" "ebsbackselection" {
  iam_role_arn = aws_iam_role.awsbackuprole.arn
  name         = "${var.service_name}-selection"
  plan_id      = aws_backup_plan.backupplan.id

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "Snapshot"
    value = "Yes"
  }
}
resource "aws_backup_selection" "rdsbackselection" {
  iam_role_arn = aws_iam_role.awsbackuprole.arn
  name         = "${var.service_name}-rds-selection"
  plan_id      = aws_backup_plan.rds_backupplan.id

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "Snapshot"
    value = "Yes"
  }
}