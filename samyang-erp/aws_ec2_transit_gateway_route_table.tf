resource "aws_ec2_transit_gateway_route_table" "samyang_tgw_rt" {
  transit_gateway_id = aws_ec2_transit_gateway.samyang_tgw.id
}