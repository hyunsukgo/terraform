## SK 이노베이션 Redshift Access ##
resource "aws_security_group" "ski-redshift-sg" {
  name        = "ski-redshift-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.ski-vpc.id

  ingress {
    description = "From SK Inovation VDI"
    from_port   = 0
    to_port     = 5439
    protocol    = "tcp"
    cidr_blocks = ["10.86.0.0/16"]
  }
  ingress {
    description = "Redshift Access Self"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self = true
  }
  /*
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  */
  tags = {
    Name = "ski-redshift-sg"
  }
}
## SK E&S Redshift Access ##
resource "aws_security_group" "skens-redshift-sg" {
  name        = "skens-redshift-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.skens-vpc.id

  ingress {
    description = "From SK E&S VDI"
    from_port   = 0
    to_port     = 5439
    protocol    = "tcp"
    cidr_blocks = ["192.9.176.0/21"]
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
## SK 홀딩스 Redshift Access ##
resource "aws_security_group" "skhc-redshift-sg" {
  name        = "skhc-redshift-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.skhc-vpc.id

  ingress {
    description = "From SK Holdings VDI"
    from_port   = 0
    to_port     = 5439
    protocol    = "tcp"
    cidr_blocks = ["10.245.40.0/21"]
  }
  ingress {
    description = "SK HC SSL VPN"
    from_port   = 0
    to_port     = 5439
    protocol    = "tcp"
    cidr_blocks = ["10.116.2.0/24"]
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
    Name = "skhc-redshift-sg"
  }
}
## SUPEX Redshift Access ##
resource "aws_security_group" "supex-redshift-sg" {
  name        = "supex-redshift-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.supex-vpc.id

  ingress {
    description = "From SUPEX VDI"
    from_port   = 0
    to_port     = 5439
    protocol    = "tcp"
    cidr_blocks = ["10.245.40.0/21"]
  }
  ingress {
    description = "SUPEX SSL VPN"
    from_port   = 0
    to_port     = 5439
    protocol    = "tcp"
    cidr_blocks = ["10.116.2.0/24"]
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
    Name = "supex-redshift-sg"
  }
}
## SUPEX Redshift Access ##
resource "aws_security_group" "newworkplace-datalake-sftp-sg" {
  name        = "newworkplace-datalake-sftp-sg"
  description = "Allow SFTP inbound traffic"
  vpc_id      = aws_vpc.datalake-vpc.id

  ingress {
    description = "SKHC Gathering Server"
    from_port   = 0
    protocol    = "tcp"
    cidr_blocks = ["10.245.75.115/32"]
  }
  ingress {
    description = "SK E&S Gathering Server"
    from_port   = 0
    protocol    = "tcp"
    cidr_blocks = ["192.9.100.58/32"]
  }
  ingress {
    description = "VPC Health Check"
    from_port   = 0
    protocol    = "tcp"
    cidr_blocks = ["10.30.0.0/24"]
  }
  ingress {
    description = "SUPEX Gathering Server"
    from_port   = 0
    protocol    = "tcp"
    cidr_blocks = ["10.245.75.116/32"]
  }
  ingress {
    description = "SKI Gathering Server"
    from_port   = 0
    protocol    = "tcp"
    cidr_blocks = ["168.154.122.206/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "newworkplace-datalake-sftp-sg"
  }
}