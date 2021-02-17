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

resource "aws_iam_group_policy" "my_developer_policy" {
  name  = "my_developer_policy"
  group = aws_iam_group.my_developers.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}