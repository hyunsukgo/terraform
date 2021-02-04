resource "aws_customer_gateway" "cgw" {
  bgp_asn    = 65000
  ip_address = local.cgw
  type       = "ipsec.1"

  tags = {
    Name = "${local.service_name}-customer-gateway"
  }
}