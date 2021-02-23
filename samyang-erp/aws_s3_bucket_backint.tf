resource "aws_s3_bucket" "backintbucket" {
  bucket        = "${local.service_name}-backint-bucket"
  force_destroy = true

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "s3:GetBucketPolicyStatus",
                "s3:GetBucketLocation",
                "s3:ListBucket",
                "s3:GetBucketAcl",
                "s3:GetBucketPolicy"
            ],
            "Resource": [
                "arn:aws:s3:::${local.service_name}-backint-bucket*"
            ]
        },
        {
              "Sid": "VisualEditor0",
              "Effect": "Allow",
              "Action": [
                  "s3:PutObjectTagging",
                  "s3:PutObject",
                  "s3:GetObject",
                  "s3:DeleteObject"
              ],
              "Resource": "arn:aws:s3:::${local.service_name}-backint-bucket*"
        }
    ]
}
POLICY
  tags = {
    Name        = "${local.service_name}-bucket"
    Environment = "Prd"
  }
}