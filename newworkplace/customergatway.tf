resource "aws_customer_gateway" "cgw" {
  bgp_asn    = 65000
  ip_address = "168.154.122.206"
  type       = "ipsec.1"

  tags = {
    Name = "${local.service_name}-cgw"
  }
}