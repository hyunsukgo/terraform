
resource "aws_instance" "sbodev" {
  ami           = "ami-0fc1ba861e48fc890" # ap-northeast-2
  instance_type = "c5.2xlarge"

  private_ip           = "10.200.30.31"
  key_name             = "samyangerp"
  iam_instance_profile = "ssm"

  root_block_device {
    volume_type = "gp3"
    iops        = 3000
    throughput  = 125
    volume_size = 100
    tags = {
      Name      = "sy-sbo-sbodev"
      Partition = "sbodev_C"
      cz-ext1   = "sy-sbo-sbodev"
    }
  }
  user_data               = file("./scripts/wininst.sh")
  disable_api_termination = "true"
  vpc_security_group_ids  = [aws_security_group.allow_from_trust_to_sbodev.id]
  subnet_id               = aws_subnet.SAPDEV_A.id

  tags = {
    Name        = "sy-sbo-sbodev"
    Description = "BI (SAP BO)"
    Environment = "Dev"
    cz-product  = "Non-SAP"
    Schedule    = "samyang-office-hours"
    Snapshot    = "Yes"
    cz-ext1     = "sy-sbodev"
  }
}

resource "aws_volume_attachment" "sbodev_att" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.sbodev_add.id
  instance_id = aws_instance.sbodev.id
}

resource "aws_ebs_volume" "sbodev_add" {
  availability_zone = "${var.region}a"
  size              = 300
  type              = "gp3"
  tags = {
    Snapshot  = "true"
    Name      = "sy-sbo-sbodev"
    Partition = "sbodev_D"
    cz-ext1   = "sy-sbodev"
  }
}
