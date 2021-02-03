resource "aws_subnet" "sap-hana-group" {
  count = 2

  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index)
  vpc_id            = aws_vpc.vpc.id

  tags = {
    name = ${local.workload}-subnet
  }
}
