
resource "aws_security_group" "allow_ssh_from_vpn" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "SSH From On-Prem"
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
    Name = "allow_ssh"
  }
}
resource "aws_security_group" "allow_from_trust_to_ap" {
  name        = "allow_traffic_s4h_ap"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "SSH From On-Prem"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "SMTP"
    from_port       = 25
    to_port         = 25
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "Host agent access"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "Host agent access"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "Host agent access"
    from_port       = 1128
    to_port         = 1129
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "From On-Prem"
    from_port       = 2500
    to_port         = 2500
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "From On-Prem"
    from_port       = 3200
    to_port         = 3399
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "From On-Prem"
    from_port       = 3600
    to_port         = 3699
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "From On-Prem"
    from_port       = 4237
    to_port         = 4237
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "From On-Prem"
    from_port       = 4900
    to_port         = 4999
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "From On-Prem"
    from_port       = 8000
    to_port         = 8999
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "From On-Prem"
    from_port       = 4300
    to_port         = 4399
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "Database client access to tenant database."
    from_port       = 30000
    to_port         = 39999
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "Allows access for HANA Studio from RDP instance."
    from_port       = 50000
    to_port         = 59999
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
    Name = "allow_from_trust_to_ap"
  }
}

resource "aws_security_group" "allow_from_trust_to_db" {
  name        = "allow_traffic_s4h_db"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "SSH From On-Prem"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "Host agent access"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "SSH From On-Prem"
    from_port       = 25
    to_port         = 25
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "Host agent access"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "Host agent access"
    from_port       = 1128
    to_port         = 1129
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "From On-Prem"
    from_port       = 3200
    to_port         = 3299
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "From On-Prem"
    from_port       = 3300
    to_port         = 3399
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "From On-Prem"
    from_port       = 3600
    to_port         = 3699
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "From On-Prem"
    from_port       = 4237
    to_port         = 4237
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "From On-Prem"
    from_port       = 4900
    to_port         = 4999
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "From On-Prem"
    from_port       = 8000
    to_port         = 8999
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "From On-Prem"
    from_port       = 4300
    to_port         = 4399
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "From On-Prem"
    from_port       = 4900
    to_port         = 4999
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "Database client access to tenant database."
    from_port       = 30000
    to_port         = 39999
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "Allows access for HANA Studio from RDP instance."
    from_port       = 50000
    to_port         = 59999
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
    Name = "allow_from_trust_to_db"
  }
}

resource "aws_security_group" "allow_from_trust_to_po" {
  name        = "allow_traffic_s4h_po"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "From On-Prem"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  ingress {
    description     = "Host agent access"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "Host agent access"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  ingress {
    description     = "SAP JVM Monitoring"
    from_port       = 1099
    to_port         = 1099
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }

  ingress {
    description     = "Host agent access"
    from_port       = 1128
    to_port         = 1129
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "From On-Prem"
    from_port       = 3200
    to_port         = 3299
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "From On-Prem"
    from_port       = 3300
    to_port         = 3399
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "From On-Prem"
    from_port       = 3600
    to_port         = 3699
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "From On-Prem"
    from_port       = 4237
    to_port         = 4237
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "ASE Cockpit"
    from_port       = 4000
    to_port         = 4999
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "From On-Prem"
    from_port       = 4900
    to_port         = 4999
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "From On-Prem"
    from_port       = 8000
    to_port         = 8199
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "from On-Prem"
    from_port       = 4300
    to_port         = 4399
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "Database client access to tenant database."
    from_port       = 30000
    to_port         = 39999
    protocol        = "tcp"
    prefix_list_ids = [aws_ec2_managed_prefix_list.trusted.id]
  }
  ingress {
    description     = "Allows access for HANA Studio from RDP instance."
    from_port       = 50000
    to_port         = 59999
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
    Name = "allow_from_trust_to_po"
  }
} 