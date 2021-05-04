resource "aws_vpn_connection" "vpn" {
  customer_gateway_id = aws_customer_gateway.cgw.id
  transit_gateway_id  = aws_ec2_transit_gateway.tgw.id
  type                = aws_customer_gateway.cgw.type
  static_routes_only  = true
}

resource "aws_vpn_connection" "ksnet-vpn" {
  customer_gateway_id = aws_customer_gateway.ksnet_cgw.id
  transit_gateway_id  = aws_ec2_transit_gateway.tgw.id
  type                = aws_customer_gateway.cgw.type
  #static_routes_only  = true
}