resource "aws_iam_user" "architect" {
  name = "skcc-sa"

  tags = {
    company = "SKCC"
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
resource "aws_iam_user" "syc196561" {
  name = "syc196561"

  tags = {
    company     = "Samyang"
    Description = "이민숙"
  }
}
resource "aws_iam_user" "syc197128" {
  name = "syc197128"

  tags = {
    company     = "Samyang"
    Description = "김범술"
  }
}
resource "aws_iam_user" "syc719860" {
  name = "syc719860"

  tags = {
    company     = "Samsung"
    Description = "조원혁"
  }
}
resource "aws_iam_user" "syc720059" {
  name = "syc720059"

  tags = {
    company     = "Samsung"
    Description = "김제호"
  }
}
resource "aws_iam_user" "syc218389" {
  name = "syc218389"

  tags = {
    company     = "Samsung"
    Description = "박훈"
  }
}
resource "aws_iam_user" "syc221025" {
  name = "syc221025"

  tags = {
    company     = "Samsung"
    Description = "백승훈"
  }
}
resource "aws_iam_user_group_membership" "syc196561" {
  user = aws_iam_user.syc196561.name

  groups = [
    aws_iam_group.ARCHITECT.name,
    aws_iam_group.SYSOPS.name,
    aws_iam_group.SECURITY.name
  ]
}
resource "aws_iam_user_group_membership" "syc218389" {
  user = aws_iam_user.syc218389.name

  groups = [
    aws_iam_group.ARCHITECT.name,
    aws_iam_group.SYSOPS.name,
    aws_iam_group.SECURITY.name
  ]
}
resource "aws_iam_user_group_membership" "syc221025" {
  user = aws_iam_user.syc221025.name

  groups = [
    aws_iam_group.ARCHITECT.name,
    aws_iam_group.SYSOPS.name,
    aws_iam_group.SECURITY.name
  ]
}
resource "aws_iam_user_group_membership" "syc197128" {
  user = aws_iam_user.syc197128.name

  groups = [
    aws_iam_group.ARCHITECT.name,
    aws_iam_group.SYSOPS.name
  ]
}

resource "aws_iam_user_group_membership" "syc719860" {
  user = aws_iam_user.syc719860.name

  groups = [
    aws_iam_group.SYSOPS.name
  ]
}

resource "aws_iam_user_group_membership" "syc720059" {
  user = aws_iam_user.syc720059.name

  groups = [
    aws_iam_group.SYSOPS.name
  ]
}