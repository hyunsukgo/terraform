resource "aws_subnet" "eks-subnet-a" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "${substr("${local.cidr}", 0, 6)}.1.0/25"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "${local.service_name}-eks-subnet-a"
  }
}
resource "aws_subnet" "eks-subnet-c" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "${substr("${local.cidr}", 0, 6)}.1.128/25"
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "${local.service_name}-eks-subnet-c"
  }
}