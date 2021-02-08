resource "aws_ec2_transit_gateway_route" "vpn_route" {
  destination_cidr_block         = "130.1.0.0/16"
  transit_gateway_attachment_id = data.aws_ec2_transit_gateway_vpn_attachment.tgw_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt.id
}