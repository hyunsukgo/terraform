data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "sap-hana-sb" {
  count = 2

  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block = cidrsubnet(aws_vpc.samyang_vpc.cidr_block, 8, count.index)
  vpc_id = aws_vpc.samyang_vpc.id

  tags = {
    name = "${local.workload}-subnet"
  }
}
