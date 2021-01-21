
resource "aws_subnet" "ski-redshift-subnet-a" {
  vpc_id     = aws_vpc.ski-vpc.id
  cidr_block = "10.0.1.0/25"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "ski-redshift-subnet-a"
  }
}
resource "aws_subnet" "ski-redshift-subnet-c" {
  vpc_id     = aws_vpc.ski-vpc.id
  cidr_block = "10.0.1.128/25"
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "ski-redshift-subnet-c"
  }
}
resource "aws_subnet" "skens-redshift-subnet-a" {
  vpc_id     = aws_vpc.skens-vpc.id
  cidr_block = "10.1.1.0/25"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "skens-redshift-subnet-a"
  }
}
resource "aws_subnet" "skebs-redshift-subnet-c" {
  vpc_id     = aws_vpc.skens-vpc.id
  cidr_block = "10.1.1.128/25"
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "skens-redshift-subnet-c"
  }
}
resource "aws_subnet" "skhc-redshift-subnet-a" {
  vpc_id     = aws_vpc.skhc-vpc.id
  cidr_block = "10.2.1.0/25"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "skhc-redshift-subnet-a"
  }
}
resource "aws_subnet" "skhc-redshift-subnet-c" {
  vpc_id     = aws_vpc.skhc-vpc.id
  cidr_block = "10.2.1.128/25"
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "skhc-redshift-subnet-c"
  }
}

resource "aws_subnet" "supex-redshift-subnet-a" {
  vpc_id     = aws_vpc.supex-vpc.id
  cidr_block = "10.3.1.0/25"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "supex-redshift-subnet-a"
  }
}
resource "aws_subnet" "supex-redshift-subnet-c" {
  vpc_id     = aws_vpc.supex-vpc.id
  cidr_block = "10.3.1.128/25"
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "supex-redshift-subnet-c"
  }
}

resource "aws_subnet" "ski-glue-subnet" {
  vpc_id     = aws_vpc.ski-vpc.id
  cidr_block = "10.0.100.0/24"

  tags = {
    Name = "ski-glue-subnet"
  }
}
resource "aws_subnet" "skens-glue-subnet" {
  vpc_id     = aws_vpc.skens-vpc.id
  cidr_block = "10.1.100.0/24"

  tags = {
    Name = "skens-glue-subnet"
  }
}
resource "aws_subnet" "skhc-glue-subnet" {
  vpc_id     = aws_vpc.skhc-vpc.id
  cidr_block = "10.2.100.0/24"

  tags = {
    Name = "skhc-glue-subnet"
  }
}
resource "aws_subnet" "supex-glue-subnet" {
  vpc_id     = aws_vpc.supex-vpc.id
  cidr_block = "10.3.100.0/24"

  tags = {
    Name = "supex-glue-subnet"
  }
}
resource "aws_subnet" "newworkplace-datalake-sftp-subnet-a" {
  vpc_id     = aws_vpc.datalake-vpc.id
  cidr_block = "10.30.0.0/28"

  tags = {
    Name = "newworkplace-datalake-sftp-subnet-a"
  }
}
resource "aws_subnet" "newworkplace-datalake-sftp-subnet-b" {
  vpc_id     = aws_vpc.datalake-vpc.id
  cidr_block = "10.30.0.16/28"

  tags = {
    Name = "newworkplace-datalake-sftp-subnet-b"
  }
}
resource "aws_subnet" "newworkplace-datalake-sftp-subnet-c" {
  vpc_id     = aws_vpc.datalake-vpc.id
  cidr_block = "10.30.0.32/28"

  tags = {
    Name = "newworkplace-datalake-sftp-subnet-c"
  }
}