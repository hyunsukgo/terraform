resource "aws_subnet" "redshift-subnet-a" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "${substr("${local.cidr}", 0, 3)}.1.0/25"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "${local.service_name}-redshift-subnet-a"
  }
}
resource "aws_subnet" "redshift-subnet-c" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "${substr("${local.cidr}", 0, 3)}.1.128/25"
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "${local.service_name}-redshift-subnet-c"
  }
}
resource "aws_subnet" "glue-subnet" {
  vpc_id     = aws_vpc.ski-vpc.id
  cidr_block = "${substr("${local.cidr}", 0, 3)}.100.0/24"

  tags = {
    Name = "${local.service_name}-glue-subnet"
  }
}