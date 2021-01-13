resource "aws_route_table" "route-table" {

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_vpn_gateway.vpg.id
  }

  tags = {
    Name = "${local.service_name}-public-rt"
  }
}