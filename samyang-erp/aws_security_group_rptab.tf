
resource "aws_security_group" "allow_from_trust_to_rptab" {
  name        = "allow_traffic_rptap"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "Access for RDP"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["130.1.0.0/16", "10.200.0.0/16"]
  }

  ingress {
    description = "Access from ALB (HTTP)"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    #cidr_blocks = ["130.1.0.0/16", "10.200.0.0/16"]
    security_groups = [aws_security_group.allow_from_trust_to_report_alb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_from_trust_to_rptab"
  }
} 