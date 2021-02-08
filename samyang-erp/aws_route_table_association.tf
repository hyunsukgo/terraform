resource "aws_route_table_association" "a" {
  subnet_id      = [aws_subnet.COMMON1_A.id,aws_subnet.SAPDEV_A.id]
  route_table_id = aws_route_table.r.id
}