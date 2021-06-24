
resource "aws_instance" "drawbkap" {
  ami           = "ami-0133b1a5b9ca9be36" # ap-northeast-2
  instance_type = "c5.2xlarge"

  private_ip           = "10.200.50.245"
  key_name             = "samyangerp"
  iam_instance_profile = "ssm"

  root_block_device {
    volume_type = "gp3"
    volume_size = 100
    iops        = 3000
    throughput  = 125
    tags = {
      Name      = "sy-drawbkap"
      Partition = "drawbkap_root"
      cz-ext1   = "sy-drawbkap"
    }
  }
  user_data               = file("./scripts/wininst.sh")
  disable_api_termination = "true"
  vpc_security_group_ids  = [aws_security_group.allow_from_trust_to_drawbkap.id]
  subnet_id               = aws_subnet.LEGADMZ_A.id

  tags = {
    Name        = "sy-drawbkap"
    Description = "관세환급 AP"
    Environment = "Prd"
    cz-product  = "Non-SAP"
    Schedule    = "samyang-office-hours"
    Snapshot    = "Yes"
    cz-ext1     = "sy-drawbkap"
  }
}

resource "aws_volume_attachment" "drawbkap_att" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.drawbkap_add.id
  instance_id = aws_instance.drawbkap.id
}

resource "aws_ebs_volume" "drawbkap_add" {
  availability_zone = "${var.region}a"
  size              = 150
  iops              = 3000
  throughput        = 125
  type              = "gp3"
  tags = {
    Snapshot  = "true"
    Name      = "sy-drawbkap"
    Partition = "drawbkap_D"
    cz-ext1   = "sy-drawbkap"
  }
}

resource "aws_eip" "drawbkap_eip" {
  vpc      = true
  instance = aws_instance.drawbkap.id
  tags = {
    Name        = "${var.service_name}-drawbkap-EIP"
    Description = "관세환급 공인 IP(국세청 등록)"
  }
}