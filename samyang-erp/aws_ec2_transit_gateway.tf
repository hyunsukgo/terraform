resource "aws_ec2_transit_gateway" "samyang_tgw" {
  description = "samyang_tgw"
  tags = {
      Name = "samyang_tgw"
  }
}