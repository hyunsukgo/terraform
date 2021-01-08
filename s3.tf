## SK 이노베이션 S3 버킷 ##
resource "aws_s3_bucket" "ski-data-source" {
  bucket = "ski-data-source"
  acl    = "private"

  tags = {
    Name        = "ski-data-source"
    Environment = "prd"
  }
}
resource "aws_s3_bucket" "ski-data-source-dev" {
  bucket = "ski-data-source-dev"
  acl    = "private"

  tags = {
    Name        = "ski-data-source-dev"
    Environment = "dev"
  }
}
resource "aws_s3_bucket" "ski-etl-scripts" {
  bucket = "ski-etl-scripts"
  acl    = "private"

  tags = {
    Name        = "ski-etl-scripts"
    Environment = "prd"
  }
}
## SK E&S S3 버킷 ##
resource "aws_s3_bucket" "skens-data-source" {
  bucket = "skens-data-source"
  acl    = "private"

  tags = {
    Name        = "skens-data-source"
    Environment = "prd"
  }
}
resource "aws_s3_bucket" "skens-data-source-dev" {
  bucket = "skens-data-source-dev"
  acl    = "private"

  tags = {
    Name        = "skens-data-source-dev"
    Environment = "dev"
  }
}
resource "aws_s3_bucket" "skens-etl-scripts" {
  bucket = "skens-etl-scripts"
  acl    = "private"

  tags = {
    Name        = "skens-etl-scripts"
    Environment = "prd"
  }
}
## SUPEX S3 버킷 ##
resource "aws_s3_bucket" "supex-data-source" {
  bucket = "supex-data-source"
  acl    = "private"

  tags = {
    Name        = "supex-data-source"
    Environment = "prd"
  }
}
resource "aws_s3_bucket" "supex-data-source-dev" {
  bucket = "supex-data-source-dev"
  acl    = "private"

  tags = {
    Name        = "supex-data-source-dev"
    Environment = "dev"
  }
}
resource "aws_s3_bucket" "supex-etl-scripts" {
  bucket = "supex-etl-scripts"
  acl    = "private"

  tags = {
    Name        = "supex-etl-scripts"
    Environment = "prd"
  }
}
## SK 홀딩스 S3 버킷 ##
resource "aws_s3_bucket" "skhc-data-source" {
  bucket = "skhc-data-source"
  acl    = "private"

  tags = {
    Name        = "skhc-data-source"
    Environment = "prd"
  }
}
resource "aws_s3_bucket" "skhc-data-source-dev" {
  bucket = "skhc-data-source-dev"
  acl    = "private"

  tags = {
    Name        = "skhc-data-source-dev"
    Environment = "dev"
  }
}
resource "aws_s3_bucket" "skhc-etl-scripts" {
  bucket = "skhc-etl-scripts"
  acl    = "private"

  tags = {
    Name        = "skhc-etl-scripts"
    Environment = "prd"
  }
}
