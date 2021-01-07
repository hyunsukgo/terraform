resource "aws_security_group" "skens-redshift-sg" {
  name        = "skens-redshift-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.skens-vpc.id

  ingress {
    description = "From SK E&S VDI"
    from_port   = 0
    to_port     = 5439
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.skens-vpc.cidr_block]
  }
  ingress {
    description = "Redshift Access Self"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "skens-redshift-sg"
  }
}