resource "aws_instance" "sopdev" {
  ami           = "ami-0fc1ba861e48fc890" # ap-northeast-2
  instance_type = "r5.2xlarge"

  private_ip           = "10.200.60.11"
  key_name             = "samyangerp"
  iam_instance_profile = "ssm"
  user_data            = file("./scripts/wininst.sh")

  root_block_device {
    volume_type = "gp3"
    volume_size = 100
    tags = {
      Name      = "sy-leg-sopdev"
      Partition = "sopdev_C"
      cz-ext1   = "sy-sopdev"
    }
  }
  disable_api_termination = "true"
  vpc_security_group_ids  = [aws_security_group.allow_from_trust_to_sopdev.id]
  subnet_id               = aws_subnet.LEGADEV_A.id

  tags = {
    Name        = "sy-leg-sopdev"
    Description = "S&OP 인스턴스"
    Environment = "Dev"
    cz-product  = "Non-SAP"
    Snapshot    = "Yes"
    cz-ext1     = "sy-sopdev"
  }
}

resource "aws_volume_attachment" "sopdev_att" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.sopdev_add.id
  instance_id = aws_instance.sopdev.id
}

resource "aws_ebs_volume" "sopdev_add" {
  availability_zone = "${var.region}a"
  size              = 300
  type              = "gp3"
  tags = {
    Snapshot  = "true"
    Name      = "sy-leg-sopdev"
    Partition = "sopdev_D"
    cz-ext1   = "sy-sopdev"
  }
}