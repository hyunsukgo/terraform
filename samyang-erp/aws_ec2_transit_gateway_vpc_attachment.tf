resource "aws_ec2_transit_gateway_vpc_attachment" "samyang_tgw_attachment" {
  subnet_ids         = [aws_subnet.sap-hana-sb.id]
  transit_gateway_id = aws_ec2_transit_gateway.samyang_tgw.id
  vpc_id             = aws_vpc.samyang_vpc.id
}