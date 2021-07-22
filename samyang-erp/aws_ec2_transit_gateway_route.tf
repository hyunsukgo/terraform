/*resource "aws_ec2_transit_gateway_route" "vpn_route" {
  destination_cidr_block         = var.onprem
  transit_gateway_attachment_id  = data.aws_ec2_transit_gateway_vpn_attachment.tgw_attachment_vpn.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt.id
}
*/

resource "aws_ec2_transit_gateway_route" "ksnet_vpn_route" {
  destination_cidr_block         = var.ksnet
  transit_gateway_attachment_id  = data.aws_ec2_transit_gateway_vpn_attachment.tgw_attachment_ksnet-vpn.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt.id
}