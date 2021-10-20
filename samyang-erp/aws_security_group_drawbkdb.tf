
resource "aws_security_group" "allow_from_trust_to_drawbkdb" {
  name        = "allow_traffic_drawbkdb"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "Oracle Connection from drawbkap"
    from_port       = 1521
    to_port         = 1521
    protocol        = "tcp"
    security_groups = [aws_security_group.allow_from_trust_to_drawbkap.id]
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }



  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "LEG_drawbkdb"
  }
} 