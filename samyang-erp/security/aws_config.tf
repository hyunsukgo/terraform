resource "aws_config_aggregate_authorization" "config" {
  account_id = local.account_id
  region     = local.region
}

resource "aws_config_config_rule" "config-rule" {
  name = "example"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_VERSIONING_ENABLED"
  }

  depends_on = [aws_config_configuration_recorder.foo]
}

resource "aws_config_configuration_recorder" "recorder" {
  name     = "recorder"
  role_arn = aws_iam_role.config-role.arn
}

resource "aws_iam_role" "config-role" {
  name = "${local.service_name}-awsconfig-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "config.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy" "config-policy" {
  name = "my-awsconfig-policy"
  role = aws_iam_role.config-role.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Action": "config:Put*",
          "Effect": "Allow",
          "Resource": "*"

      }
  ]
}
POLICY
}