resource "aws_subnet" "eks-subnet-a" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "${cidrsubnet("${local.cidr}",9,1)}"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "${local.service_name}-eks-subnet-a"
  }
}
resource "aws_subnet" "eks-subnet-c" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "${cidrsubnet("${local.cidr}",9,2)}"
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "${local.service_name}-eks-subnet-c"
  }
}