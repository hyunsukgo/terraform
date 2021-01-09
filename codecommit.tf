resource "aws_codecommit_repository" "ski-etl-script" {
  repository_name = "ski-etl-script"
  description     = "SKI ETL Repository"
}
resource "aws_codecommit_repository" "skens-etl-script" {
  repository_name = "skens-etl-script"
  description     = "SK E&S ETL Repository"
}
resource "aws_codecommit_repository" "skhc-etl-script" {
  repository_name = "skhc-etl-script"
  description     = "SK Holdings ETL Repository"
}
resource "aws_codecommit_repository" "supex-etl-script" {
  repository_name = "supex-etl-script"
  description     = "SUPEX ETL Repository"
}