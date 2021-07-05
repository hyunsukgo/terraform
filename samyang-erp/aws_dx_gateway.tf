resource "aws_dx_gateway" "example" {
  name            = "${var.service_name}-dxg"
  amazon_side_asn = "64512"
}