resource "aws_instance" "eaccdb" {
  ami           = "ami-0fc1ba861e48fc890" # ap-northeast-2
  instance_type = "c5.2xlarge"
  ebs_optimized = true
  private_ip           = "10.200.50.251"
  key_name             = "samyangerp"
  iam_instance_profile = "ssm"

  root_block_device {
    volume_type = "gp2"
    volume_size = 50
    tags = {
      Name      = "sy-eaccdb"
      Partition = "ecccdb_C"
      cz-ext1   = "sy-eaccdb"
    }
  }
  disable_api_termination = "true"
  vpc_security_group_ids = [aws_security_group.allow_from_trust_to_eaccdb.id]
  subnet_id = aws_subnet.LEGADMZ_A.id

  tags = {
    Name        = "sy-eaccdb"
    Description = "전자전표(DB)"
    Environment = "Dev"
    cz-product  = "Non-SAP"
    Schedule    = "samyang-office-hours"
    Snapshot    = "Yes"
    cz-ext1   = "sy-eaccdb"
  }
}

resource "aws_volume_attachment" "eaccdb_att" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.eaccdb_add.id
  instance_id = aws_instance.eaccdb.id
}

resource "aws_ebs_volume" "eaccdb_add" {
  availability_zone = "${var.region}a"
  size              = 100
  type              = "gp2"
  tags = {
    Snapshot  = "true"
    Name      = "sy-eaccdb"
    Partition = "ecccdb_D"
    cz-ext1   = "sy-eaccdb"
  }
}