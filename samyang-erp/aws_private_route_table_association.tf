data "aws_subnet" "private_subnets" {
  filter {
    name = "tag:RT"
    values = ["private"]
  }
}

resource "aws_route_table_association" "private_rta" {
  subnet_id      = data.aws_subnet.private_subnets.id[*]
  route_table_id = aws_route_table.private_route.id
}