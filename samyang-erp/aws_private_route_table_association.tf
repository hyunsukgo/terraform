data "aws_subnet_id" "private_subnets" {
  filter {
    name = "tag:RT"
    values = ["private"]
  }
}

resource "aws_route_table_association" "private_rta" {
  count          = length(data.aws_subnet_id.private_subnets.ids)
  subnet_id      = data.aws_subnet_ids.private_subnets.id[count.index]
  route_table_id = aws_route_table.private_route.id
}