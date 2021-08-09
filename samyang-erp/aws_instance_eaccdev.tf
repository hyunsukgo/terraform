
resource "aws_instance" "eaccapdev" {
  ami                  = "ami-0fc1ba861e48fc890" # ap-northeast-2
  instance_type        = "m5.xlarge"
  ebs_optimized        = true
  private_ip           = "10.200.60.31"
  key_name             = "samyangerp"
  iam_instance_profile = "ssm"

  root_block_device {
    volume_type = "gp3"
    iops        = 3000
    throughput  = 125
    volume_size = 40
    tags = {
      Name      = "sy-eaccdev"
      Partition = "ecccdev_C"
      cz-ext1   = "sy-eaccdev"
    }
  }
  disable_api_termination = "true"
  vpc_security_group_ids  = [aws_security_group.allow_from_trust_to_eaccap.id]
  subnet_id               = aws_subnet.LEGADEV_A.id

  tags = {
    Name        = "sy-leg-eaccdev"
    Description = "전자전표(AP)"
    Environment = "Dev"
    cz-product  = "Non-SAP"
    Schedule    = "samyang-office-hours"
    Snapshot    = "Yes"
    cz-ext1     = "sy-eaccdev"
  }
}

resource "aws_volume_attachment" "eaccapdev_att" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.eaccapdev_add.id
  instance_id = aws_instance.eaccapdev.id
}

resource "aws_ebs_volume" "eaccapdev_add" {
  availability_zone = "${var.region}a"
  size              = 60
  iops              = 3000
  throughput        = 125
  type              = "gp3"
  tags = {
    Snapshot  = "true"
    Name      = "sy-eaccdev"
    Partition = "ecccdev_D"
    cz-ext1   = "sy-eaccdev"
  }
}
