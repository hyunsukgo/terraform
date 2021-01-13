resource "aws_vpn_connection" "customer-to-vdi" {
  vpn_gateway_id      = aws_vpn_gateway.vpg.id
  customer_gateway_id = aws_customer_gateway.cgw.id
  type                = "ipsec.1"
  static_routes_only  = true
  depends_on = [aws_vpn_gateway.vpg, aws_customer_gateway.cgw]
  tags = {
      Name = "${local.service_name}-vpn"
  }
}
resource "aws_vpn_gateway_route_propagation" "route_propagation" {
  vpn_gateway_id = aws_vpn_gateway.vpg.id
  route_table_id = aws_route_table.route_table.id
  depends_on = [aws_route_table.route_table,aws_vpn_gateway.vpg]
}