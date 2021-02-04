resource "aws_iam_user" "sk_architect" {
  name = "loadbalancer"

  tags = {
    tag-key = "tag-value"
  }
}


resource "aws_iam_user_policy" "lb_ro" {
  name = "Admin"
  user = aws_iam_user.sk_architect.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
EOF
}