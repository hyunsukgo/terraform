data "aws_ec2_transit_gateway_vpn_attachment" "tgw_attachment" {
  transit_gateway_id = "${aws_ec2_transit_gateway.tgw.id}"
  vpn_connection_id  = "${aws_vpn_connection.vpn.id}"
}