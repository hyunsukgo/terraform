resource "aws_lakeformation_data_lake_settings" "example" {
  admins = [aws_iam_user.test.arn, aws_iam_role.test.arn]
}