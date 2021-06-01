resource "aws_security_group" "allow_from_trust_to_spqap" {
  name        = "allow_traffic_spqap"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc.id
  
  ingress {
    description     = "spqap Endpoint"
    from_port       = 22
    to_port         = 22
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
    Name = "allow_from_trust_to_spqap"
  }
}
