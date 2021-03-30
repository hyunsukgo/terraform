resource "aws_instance" "saprouter" {
  ami           = "ami-006e2f9fa7597680a" # ap-northeast-2
  instance_type = "t3.small"

  private_ip = "10.200.0.60"
  key_name   = "samyangerp"
  root_block_device {
    volume_type = "gp2"
    volume_size = 10
    tags = {
      Name      = "sy-saprouter"
      Partition = "saprouter_root"
      cz-ext1   = "sy-saprouter"
    }
  }
  disable_api_termination = "true"
  vpc_security_group_ids = [aws_security_group.allow_from_trust_to_saprouter.id]
  subnet_id = aws_subnet.COMMON1_A.id

  tags = {
    Name        = "sy-saprouter"
    Description = "SAP Router 인스턴스"
    Environment = "Prd"
    cz-product  = "SAP"
    #Schedule    = "samyang-office-hours"
    cz-ext1   = "sy-saprouter"
  }
}

resource "aws_eip" "saproutereip" {
  vpc = true

  instance   = aws_instance.saprouter.id
  depends_on = [aws_internet_gateway.gw]
  tags = {
    Name = "SAP Router EIP"
  }
}