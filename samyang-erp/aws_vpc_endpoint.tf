resource "aws_vpc_endpoint" "s3" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.ap-northeast-2.s3"
  vpc_endpoint_type = "Interface"
  subnet_ids = [aws_route_table.INTERNAL1_A.id,aws_route_table.INTERNAL2_C.id]
  security_group_ids = [
    aws_security_group.allow_from_trust_to_s3end.id
  ]
}

resource "aws_security_group" "allow_from_trust_to_s3end" {
  name        = "allow_traffic_rptap"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "Access for S3Endpoint"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_from_trust_to_s3_endpoint"
  }
} 