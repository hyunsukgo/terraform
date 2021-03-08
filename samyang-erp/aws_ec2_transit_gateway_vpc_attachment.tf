resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attachment_vpc" {
  subnet_ids         = [aws_subnet.COMMON1_A.id,aws_subnet.COMMON2_C.i]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.vpc.id
}
