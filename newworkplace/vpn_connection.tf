resource "aws_vpn_connection" "customer-to-vdi" {
  vpn_gateway_id      = aws_vpn_gateway.vpg.id
  customer_gateway_id = aws_customer_gateway.cgw.id
  type                = "ipsec.1"
  static_routes_only  = true
  depends_on = [aws_vpn_gateway.vpg, aws_customer_gateway.cgw]
  tags {
      Name = "${local.service_name}-vpn"
  }
}