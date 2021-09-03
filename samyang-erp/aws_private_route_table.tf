resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }
  route {
    cidr_block                = "10.100.0.0/16"
    vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
  }
  /*
  route {
    cidr_block         = "130.1.0.0/16"
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }
  
  route {
    cidr_block         = "10.20.0.0/16"
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }
*/
  route {
    cidr_block         = var.ksnet
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }
  route {
    cidr_block         = "129.200.9.0/24"
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }
  
  route {
    cidr_block         = "10.150.110.10/32"
    #instance_id        = "i-0d600d31681de2bb2"
    network_interface_id = "eni-065bccc4a14646929"
  }

   route {
    cidr_block         = "10.150.110.40/32"
    #instance_id        = "i-0d600d31681de2bb2"
    network_interface_id = "eni-0c3ec8755b10ee108"
  }


  route {
    cidr_block         = "10.150.220.10/32"
    #instance_id        = "i-0262a7a8c467645bd"
    #network_interface_id = "eni-0f8ca819e334558cb"
    network_interface_id = "eni-01a386fafe97e7251"
  }

  route {
    cidr_block         = "10.150.220.15/32"
    #instance_id        = "i-0a1c79c8d70997fbc"
    network_interface_id = "eni-0f8ca819e334558cb"
    #network_interface_id = "eni-01a386fafe97e7251"
  }

  route {
    cidr_block         = "10.150.220.20/32"
    #instance_id        = "i-0f6f843bf0144dd96"
    network_interface_id = "eni-0dd815f601a66a574"
  }

  route {
    cidr_block         = "10.150.220.25/32"
    #instance_id                = "i-0f6f843bf0144dd96"
    network_interface_id = "eni-0b259b094bd33cb49"
  }

  route {
    cidr_block         = "10.150.220.40/32"
    network_interface_id = "eni-019c838808d809f7d"
  }

  route {
    cidr_block         = "10.150.220.45/32"
    network_interface_id = "eni-069b84aa0dc9a3a65"
  }
  /*
  route {
    cidr_block         = "172.16.16.0/24"
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }
*/
  tags = {
    Name = "${var.service_name}-private-rt"
    LaunchWizardApplicationType = "SAP"
  }
}