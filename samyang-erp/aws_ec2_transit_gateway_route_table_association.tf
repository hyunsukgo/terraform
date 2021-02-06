resource "aws_ec2_transit_gateway_route_table_association" "tgw_rta" {
  transit_gateway_attachment_id  = data.aws_ec2_transit_gateway_vpn_attachment.tgw_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt.id
}