resource "aws_subnet" "eks-subnet-a" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "${cidrsubnet("${local.cidr}",9,5)}"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "${local.service_name}-subnet-a"
  }
}
resource "aws_subnet" "eks-subnet-c" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "${cidrsubnet("${local.cidr}",9,6)}"
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "${local.service_name}-subnet-c"
  }
}
data "aws_availability_zones" "available" {
  state = "available"
}
resource "aws_subnet" "eks-nodes-group" {
  count = 2

  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index)
  vpc_id            = aws_vpc.vpc.id

  tags = {
    "kubernetes.io/cluster/${aws_eks_cluster.eks.name}" = "shared"
  }
}
