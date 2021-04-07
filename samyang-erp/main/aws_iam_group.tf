resource "aws_iam_group" "ARCHITECT" {
  name = "ARCHITECT"
  path = "/users/"
}
resource "aws_iam_group" "SYSOPS" {
  name = "SYSOPS"
  path = "/users/"
}
resource "aws_iam_group" "OPS" {
  name = "OPS"
  path = "/users/"
}
resource "aws_iam_group" "SECURITY" {
  name = "SECURITY"
  path = "/users/"
}
resource "aws_iam_group" "SCIENTIST" {
  name = "SCIENTIST"
  path = "/users/"
}