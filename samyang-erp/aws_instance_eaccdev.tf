resource "aws_instance" "eaccapdev" {
  ami           = "ami-0fc1ba861e48fc890" # ap-northeast-2
  instance_type = "m5.xlarge"

  private_ip = "10.200.60.31"
  key_name  = "samyangerp"

  root_block_device {
    volume_type = "gp2"
    volume_size = 40
  }

  security_groups = [aws_security_group.allow_from_trust_to_eaccap.id]
  subnet_id = aws_subnet.LEGADEV_A.id

  tags = {
      Name = "sy-eaccdev"
      Description = "전자전표(AP)"
      Environment = "Dev"
      cz-product = "Non-SAP"
  }
}

resource "aws_volume_attachment" "eaccapdev_att" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.eaccdb_add.id
  instance_id = aws_instance.eaccapdev.id
}

resource "aws_ebs_volume" "eaccapdev_add" {
  availability_zone = "${local.region}a"
  size              = 60
  type              = "gp2"
  tags = {
    Snapshot = "true"
  }
}