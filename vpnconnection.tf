## SK 이노베이션과 VDI망 연결 ##
resource "aws_vpn_connection" "ski-to-vdi" {
  vpn_gateway_id      = ski-vpg.vpn_gateway.id
  customer_gateway_id = ski-cgw.customer_gateway.id
  type                = "ipsec.1"
  static_routes_only  = true
}
## SK 이노베이션과 VDI망 연결 ##
resource "aws_vpn_connection" "skens-to-vdi" {
  vpn_gateway_id      = skens-vpg.vpn_gateway.id
  customer_gateway_id = skens-cgw.customer_gateway.id
  type                = "ipsec.1"
  static_routes_only  = true
}
## SK 이노베이션과 VDI망 연결 ##
resource "aws_vpn_connection" "skhc-to-vdi" {
  vpn_gateway_id      = skhc-vpg.vpn_gateway.id
  customer_gateway_id = skhc-cgw.customer_gateway.id
  type                = "ipsec.1"
  static_routes_only  = true
}
## SK 이노베이션과 VDI망 연결 ##
resource "aws_vpn_connection" "supex-to-vdi" {
  vpn_gateway_id      = supex-vpg.vpn_gateway.id
  customer_gateway_id = supex-cgw.customer_gateway.id
  type                = "ipsec.1"
  static_routes_only  = true
}
## SK 이노베이션과 VDI망 연결 ##
resource "aws_vpn_connection" "skhc-to-datalake" {
  vpn_gateway_id      = datalake-vpg.vpn_gateway.id
  customer_gateway_id = skhc-cgw.customer_gateway.id
  type                = "ipsec.1"
  static_routes_only  = true
}
## SK 이노베이션과 VDI망 연결 ##
resource "aws_vpn_connection" "ski-to-datalake" {
  vpn_gateway_id      = datalake-vpg.vpn_gateway.id
  customer_gateway_id = ski-cgw.customer_gateway.id
  type                = "ipsec.1"
  static_routes_only  = true
}
/*## SK 이노베이션과 VDI망 연결 ##
resource "aws_vpn_connection" "skens-to-datalake" {
  vpn_gateway_id      = datalake-vpg.vpn_gateway.id
  customer_gateway_id = skens-cgw.customer_gateway.id
  type                = "ipsec.1"
  static_routes_only  = true
}
*/