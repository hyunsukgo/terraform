resource "aws_subnet" "${local.service_name}-redshift-subnet-a" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/25"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "ski-redshift-subnet-a"
  }
}
resource "aws_subnet" "${local.service_name}-redshift-subnet-c" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.128/25"
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "ski-redshift-subnet-c"
  }
}
resource "aws_subnet" "${local.service_name}-glue-subnet" {
  vpc_id     = aws_vpc.ski-vpc.id
  cidr_block = "10.0.100.0/24"

  tags = {
    Name = "ski-glue-subnet"
  }
}