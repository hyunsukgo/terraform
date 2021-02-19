data "aws_subnet_ids" "public" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    RT = "public"
  }
}

resource "aws_route_table_association" "public_rta" {
  for_each       = data.aws_subnet_ids.public.ids
  subnet_id      = each.value
  route_table_id = aws_route_table.public_route.id
}