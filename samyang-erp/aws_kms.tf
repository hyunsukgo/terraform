resource "aws_kms_key" "kms" {
  description = "KMS key"
  #  deletion_window_in_days = 10
}

resource "aws_kms_key" "backup" {
  description = "${var.service_name}-backup-vault-encrytion"
  #  deletion_window_in_days = 10
}

resource "aws_kms_key" "efs_kms" {
  description = "${var.service_name}-efs-encrytion"
  #  deletion_window_in_days = 10
}

resource "aws_kms_key" "guardduty_kms" {
  description = "${var.service_name}-guardduty-encrytion"
  #  deletion_window_in_days = 10
}

resource "aws_kms_alias" "efs" {
  name          = "alias/efs"
  target_key_id = aws_kms_key.efs_kms.key_id
}
resource "aws_kms_key" "ebs_kms" {
  description = "${var.service_name}-ebs-encrytion"
  policy      = <<EOT
{
    "Version": "2012-10-17",
    "Id": "key-default-1",
    "Statement": [
        {
            "Sid": "Enable IAM User Permissions",
            "Effect": "Allow",
            "Principal": {
                "AWS": [
                    "arn:aws:iam::969470234861:root"
                ]
            },
            "Action": "kms:*",
            "Resource": "*"
        }
    ]
}
EOT
  #  deletion_window_in_days = 10
}

resource "aws_kms_alias" "ebs" {
  name          = "alias/ebs"
  target_key_id = aws_kms_key.ebs_kms.key_id
}