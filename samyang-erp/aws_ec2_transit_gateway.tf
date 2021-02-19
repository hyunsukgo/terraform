resource "aws_ec2_transit_gateway" "tgw" {
  description = "${local.service_name}-tgw"
  tags = {
    Name = "${local.service_name}-tgw"
  }
}