resource "aws_route_table" "r" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "main"
  }
}