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

resource "aws_iam_role" "ebsbackuprole" {
  name = "test-role"

  assume_role_policy = <<EOF
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Effect":"Allow",
      "Action":"ec2:CreateTags",
      "Resource":"arn:aws:ec2:*::snapshot/*"
    },
    {
      "Effect":"Allow",
      "Action":[
        "ec2:CreateSnapshot",
        "ec2:DeleteSnapshot"
      ],
      "Resource":[
        "arn:aws:ec2:*::snapshot/*",
        "arn:aws:ec2:*:*:volume/*"
      ]
    },
    {
      "Effect":"Allow",
      "Action":[
        "ec2:DescribeVolumes",
        "ec2:DescribeSnapshots",
        "ec2:DescribeTags"
      ],
      "Resource":"*"
    },
    {
      "Action":[
        "tag:GetResources"
      ],
      "Resource":"*",
      "Effect":"Allow"
    },
    {
      "Effect":"Allow",
      "Action":[
        "backup:DescribeBackupVault",
        "backup:CopyIntoBackupVault"
      ],
      "Resource":"arn:aws:backup:*:*:backup-vault:*"
    }
  ]
}
EOF
}

resource "aws_backup_selection" "ebsbackselection" {
  iam_role_arn = aws_iam_role.ebsbackuprole.arn
  name         = "${local.service_name}-selection"
  plan_id      = aws_backup_plan.backupplan.id

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "foo"
    value = "bar"
  }
