## SK 이노베이션과 VDI망 연결 ##
resource "aws_vpn_connection" "ski-to-vdi" {
  vpn_gateway_id      = ski-vpg.vpn_gateway.id
  customer_gateway_id = ski-cgw.customer_gateway.id
  type                = "ipsec.1"
  static_routes_only  = true
  depends_on = [aws_vpn_gateway.ski-vpg, customer_gateway.ski-cgw]
}
## SK 이노베이션과 VDI망 연결 ##
resource "aws_vpn_connection" "skens-to-vdi" {
  vpn_gateway_id      = skens-vpg.vpn_gateway.id
  customer_gateway_id = skens-cgw.customer_gateway.id
  type                = "ipsec.1"
  static_routes_only  = true
  depends_on = [aws_vpn_gateway.skens-vpg, customer_gateway.skens-cgw]
}
## SK 이노베이션과 VDI망 연결 ##
resource "aws_vpn_connection" "skhc-to-vdi" {
  vpn_gateway_id      = skhc-vpg.vpn_gateway.id
  customer_gateway_id = skhc-cgw.customer_gateway.id
  type                = "ipsec.1"
  static_routes_only  = true
  depends_on = [aws_vpn_gateway.skhc-vpg, customer_gateway.skhc-cgw]
}
## SK 이노베이션과 VDI망 연결 ##
resource "aws_vpn_connection" "supex-to-vdi" {
  vpn_gateway_id      = supex-vpg.vpn_gateway.id
  customer_gateway_id = supex-cgw.customer_gateway.id
  type                = "ipsec.1"
  static_routes_only  = true
  depends_on = [aws_vpn_gateway.supex-vpg, customer_gateway.supex-cgw]
}
## SK 이노베이션과 VDI망 연결 ##
resource "aws_vpn_connection" "skhc-to-datalake" {
  vpn_gateway_id      = datalake-vpg.vpn_gateway.id
  customer_gateway_id = skhc-cgw.customer_gateway.id
  type                = "ipsec.1"
  static_routes_only  = true
  depends_on = [aws_vpn_gateway.datalake-vpg, customer_gateway.skhc-cgw]
}
## SK 이노베이션과 VDI망 연결 ##
resource "aws_vpn_connection" "ski-to-datalake" {
  vpn_gateway_id      = datalake-vpg.vpn_gateway.id
  customer_gateway_id = ski-cgw.customer_gateway.id
  type                = "ipsec.1"
  static_routes_only  = true
  depends_on = [aws_vpn_gateway.datalake-vpg, customer_gateway.ski-cgw]
}
## SK 이노베이션과 VDI망 연결 ##
resource "aws_vpn_connection" "skens-to-datalake" {
  vpn_gateway_id      = datalake-vpg.vpn_gateway.id
  customer_gateway_id = skens-cgw.customer_gateway.id
  type                = "ipsec.1"
  static_routes_only  = true
  depends_on = [aws_vpn_gateway.datalake-vpg, customer_gateway.skens-cgw]
}
