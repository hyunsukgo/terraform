resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.vpc.id
  service_name = "com.amazonaws.ap-northeast-2.s3"
}

resource "aws_vpc_endpoint_route_table_association" "s3end_rta" {
  route_table_id  = [aws_route_table.public_route.id,aws_route_table.private_route.id]
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
}