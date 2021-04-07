data "aws_iam_policy_document" "backuppolicy" {
  statement {
    sid       = ""
    effect    = "Allow"
    resources = ["arn:aws:ec2:*::snapshot/*"]
    actions   = ["ec2:CreateTags"]
  }

  statement {
    sid    = ""
    effect = "Allow"

    resources = [
      "arn:aws:ec2:*::snapshot/*",
      "arn:aws:ec2:*:*:volume/*",
    ]

    actions = [
      "ec2:CreateSnapshot",
      "ec2:DeleteSnapshot",
    ]
  }

  statement {
    sid       = ""
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "ec2:DescribeVolumes",
      "ec2:DescribeSnapshots",
      "ec2:DescribeTags",
    ]
  }

  statement {
    sid       = ""
    effect    = "Allow"
    resources = ["*"]
    actions   = ["tag:GetResources"]
  }

  statement {
    sid       = ""
    effect    = "Allow"
    resources = ["arn:aws:backup:*:*:backup-vault:*"]

    actions = [
      "backup:DescribeBackupVault",
      "backup:CopyIntoBackupVault",
    ]
  }
}