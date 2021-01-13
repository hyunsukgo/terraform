resource "aws_codecommit_repository" "etl-script" {
  repository_name = "${local.service_name}-etl-script"
  description     = "${local.service_name} ETL Repository"
}