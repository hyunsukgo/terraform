resource "aws_customer_gateway" "cgw" {
  bgp_asn    = 65000
  ip_address = var.cgw
  type       = "ipsec.1"

  tags = {
    Name = "${var.service_name}-customer-gateway"
  }
}