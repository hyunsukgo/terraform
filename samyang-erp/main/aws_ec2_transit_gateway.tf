resource "aws_ec2_transit_gateway" "tgw" {
  description = "${var.service_name}-tgw"
  tags = {
    Name = "${var.service_name}-tgw"
  }
}