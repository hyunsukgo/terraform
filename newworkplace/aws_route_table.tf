resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_vpn_gateway.vpg.id
  }

  tags = {
    Name = "${local.service_name}-public-rt"
  }
}