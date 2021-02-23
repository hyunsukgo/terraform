resource "aws_backup_vault" "backup" {
  name        = "${local.service_name}_backup_vault"
  kms_key_arn = aws_kms_key.backup.arn
}