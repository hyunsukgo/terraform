resource "aws_vpn_gateway" "vpg" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${local.service_name}.-vpg"
  }
}