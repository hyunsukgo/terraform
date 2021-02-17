resource "aws_iam_group_policy" "ARCHITECT" {
  name  = "ARCHITECT"
  group = aws_iam_group.ARCHITECT.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
})
}

resource "aws_iam_group_policy_attachment" "architect-attach" {
  group      = aws_iam_group.ARCHITECT.name
  policy_arn = aws_iam_policy.ARCHITECT.arn
}