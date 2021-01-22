resource "aws_subnet" "redshift-subnet-a" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "${substr("${local.cidr}", 0, 4)}.1.0/25"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "${local.service_name}-redshift-subnet-a"
  }
}