data "aws_ec2_transit_gateway_vpc_attachment" "tgw_attach" {
  filter {
    name   = "vpc-id"
    values = aws_vpc.vpc.id
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "tgw_attachment" {
  transit_gateway_attachment_id  = data.aws_ec2_transit_gateway_vpc_attachment.tgw_attach.name
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt.id
}