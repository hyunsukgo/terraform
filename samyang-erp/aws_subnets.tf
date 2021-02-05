
data "aws_availability_zones" "available" {
  state = "available"
  filter {
    name   = "zone-name"
    values = ["ap-northeast-2a", "ap-northeast-2c"]
  }
}
/*
resource "aws_subnet" "s4hana-subnet" {
  count = 2

  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block = cidrsubnet(aws_vpc.samyang_vpc.cidr_block, 12, count.index)
  vpc_id = aws_vpc.samyang_vpc.id

  tags = {
    name = "${local.workload}-subnet"
    op = "production"
  }
}


resource "aws_subnet" "Defalt-subnet" {
  count = 2

  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 12, count.index)
  vpc_id = aws_vpc.vpc.id

  tags = {
    name = "${local.workload}-subnet"
    op = "production"
  }
}
*/
resource "aws_subnet" "Defalt-subnet" {
  vpc_id = aws_vpc.vpc.id
  availability_zone = "ap-northeast-2a"
  cidr_block        = "10.200.30.64/26"

  tags  = {
    Name = "SAPDEV_A"
  }
}