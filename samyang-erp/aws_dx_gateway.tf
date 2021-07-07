resource "aws_dx_gateway" "dxg" {
  name            = "${var.service_name}-dxg"
  amazon_side_asn = "65534"
}

resource "aws_dx_private_virtual_interface" "private_vif" {
  connection_id = "dxcon-ffwkwwak"

  name           = "${var.service_name}-vif"
  vlan           = 117
  address_family = "ipv4"
  bgp_asn        = 65002
  dx_gateway_id  = aws_dx_gateway.dxg.id
}


resource "aws_dx_gateway_association" "dxg_assoc" {
  dx_gateway_id         = aws_dx_gateway.dxg.id
  #associated_gateway_id = aws_vpn_gateway.vpn_gw.id
  associated_gateway_id = aws_ec2_transit_gateway.tgw.id
   allowed_prefixes = [
    "10.200.0.0/16"
  ]
}
/*
resource "aws_vpn_gateway" "vpn_gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "DX Gateway"
  }
}
*/