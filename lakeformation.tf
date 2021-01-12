resource "aws_lakeformation_data_lake_settings" "example" {
  admins = [aws_iam_user.glue_service_role.arn]
}