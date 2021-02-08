resource "aws_ec2_transit_gateway" "tgw" {
  description = "${local.service_name}-tgw"
  propagation_default_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt.id
  association_default_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt.id

  tags = {
      Name = "${local.service_name}-tgw"
  }
}