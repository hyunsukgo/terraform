resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  route {
    cidr_block                = "10.100.0.0/16"
    vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
  }

  route {
    cidr_block         = "130.1.0.0/16"
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  route {
    cidr_block         = var.ksnet
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }


  tags = {
    Name = "${var.service_name}-public-rt"
  }
}