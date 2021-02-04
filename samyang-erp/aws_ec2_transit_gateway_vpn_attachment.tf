resource "aws_ec2_transit_gateway_vpn_attachment" "vpn" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
   vpn_connection_id  = aws_vpn_connection.vpn.id
}
resource "aws_vpn_connection" "vpn" {
  customer_gateway_id = aws_customer_gateway.cgw.id
  transit_gateway_id  = aws_ec2_transit_gateway.tgw.id
  type                = aws_customer_gateway.cgw.type
}