resource "aws_ec2_transit_gateway" "samyang_tgw" {
  description = "samyang-tgw"
  tags = {
      Name = "samyang-tgw"
  }
}