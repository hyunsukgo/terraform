resource "aws_instance" "mdidb" {
  ami           = "ami-0fc1ba861e48fc890" # ap-northeast-2
  instance_type = "c5.2xlarge"

  private_ip = "10.200.40.61"
  key_name   = "samyangerp"
  iam_instance_profile =  "ssm"
  user_data = "${file("wininst.sh")}"
  root_block_device {
    volume_type = "gp2"
    volume_size = 50
  }
  disable_api_termination = "true"
  #security_groups = [aws_security_group.allow_from_trust_to_mdidb.id]
  subnet_id = aws_subnet.LEGADB1_A.id

  tags = {
    Name        = "sy-mdidb"
    Description = "중계서버 인스턴스"
    Environment = "Prd"
    cz-product  = "Non-SAP"
    Schedule    = "samyang-office-hours"
  }
}

resource "aws_volume_attachment" "mdidb_att" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.mdidb_add.id
  instance_id = aws_instance.mdidb.id
}

resource "aws_ebs_volume" "mdidb_add" {
  availability_zone = "${local.region}a"
  size              = 300
  type              = "gp2"
  tags = {
    Snapshot = "true"
  }
}