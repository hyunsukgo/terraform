resource "aws_vpn_gateway_attachment" "vpg_attachment" {
  vpc_id         = aws_vpc.vpc.id
  vpn_gateway_id = aws_vpn_gateway.vpg.id
}