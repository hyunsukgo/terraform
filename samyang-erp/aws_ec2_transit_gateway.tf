resource "aws_ec2_transit_gateway" "tgw" {
  description = "${local.service_name}-tgw"
  default_route_table_association = aws_ec2_transit_gateway_route_table.tgw_rt.id
  default_route_table_propagation = aws_ec2_transit_gateway_route_table.tgw_rt.id

  tags = {
      Name = "${local.service_name}-tgw"
  }
}