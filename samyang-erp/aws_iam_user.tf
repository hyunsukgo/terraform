resource "aws_iam_user" "architect" {           
  name = "skcc-sa"
  
  tags = {
    company = ""
  }
}
resource "aws_iam_policy" "admin" {
  name        = "Architect"
  path        = "/"
  description = "Architect policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "*",
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
resource "aws_iam_policy_attachment" "admin-attach" {
  name       = "admin-attachment"
  users      = [aws_iam_user.architect.name]
  policy_arn = aws_iam_policy.admin.arn
}

