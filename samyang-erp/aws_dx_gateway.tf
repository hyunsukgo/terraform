resource "aws_dx_gateway" "example" {
  name            = "${var.service_name}-dxg"
  amazon_side_asn = "64512"
}

resource "aws_dx_private_virtual_interface" "foo" {
  connection_id = "dxcon-ffwkwwak"

  name           = "${var.service_name}-vif"
  vlan           = 4094
  address_family = "ipv4"
  bgp_asn        = 65352
}