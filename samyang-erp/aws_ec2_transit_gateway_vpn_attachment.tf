data "aws_ec2_transit_gateway_vpn_attachment" "tgw_attachment_vpn" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpn_connection_id  = aws_vpn_connection.vpn.id
}
/*
data "aws_ec2_transit_gateway_vpn_attachment" "tgw_attachment_ksnet-vpn" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpn_connection_id  = aws_vpn_connection.ksnet-vpn.id
}
*/