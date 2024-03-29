resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.COMMON2_C.id

  tags = {
    Name = "${var.service_name}-NAT"
    RT   = "public"
  }
}

resource "aws_eip" "nat_eip" {
  vpc = true
  tags = {
    Name = "${var.service_name}-EIP"
  }
}