resource "aws_iam_user" "architect" {           #담당 ㅁㄱㅊ
  name = "skcc-sa"
  
  tags = {
    company = "sk C&C"
  }
}


resource "aws_iam_user_policy" "cloud_architect" {
  name = "Admin"
  user = aws_iam_user.architect.name

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