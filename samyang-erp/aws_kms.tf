resource "aws_kms_key" "kms" {
  description = "KMS key 1"
  #  deletion_window_in_days = 10
}

resource "aws_kms_key" "backup" {
  description = "${local.service_name}-backup-vault-encrytion"
  #  deletion_window_in_days = 10
}