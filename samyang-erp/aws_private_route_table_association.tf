data "aws_subnet_ids" "private" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Tier = "private"
  }
}

resource "aws_route_table_association" "private_rta" {
  for_each      = data.aws_subnet_ids.private.ids
  subnet_id      = each.value
  route_table_id = aws_route_table.private_route.id
}