resource "aws_iam_user_policy" "IAMUserChangePassword" {
  name = "IAMUserChangePassword"
  user = [aws_iam_user.syc197128.name,aws_iam_user.syc197128.name,aws_iam_user.syc197128.name,
  aws_iam_user.syc197128.name,aws_iam_user.syc197128.name,aws_iam_user.syc197128.nam]

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "iam:ChangePassword"
            ],
            "Resource": [
                "arn:aws:iam::*:user/${aws:username}"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "iam:GetAccountPasswordPolicy"
            ],
            "Resource": "*"
        }
    ]
})
}