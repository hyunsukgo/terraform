
resource "aws_instance" "seqdb" {
  ami           = "ami-0fc1ba861e48fc890" # ap-northeast-2
  instance_type = "x1.16xlarge"

  private_ip           = "10.200.30.13"
  key_name             = "samyangerp"
  iam_instance_profile = "ssm"

  root_block_device {
    volume_type = "gp3"
    volume_size = 30
    tags = {
      Name      = "sy-seqdb"
      Partition = "seqdb_root"
      cz-ext1   = "sy-seqdb"
    }
  }
  user_data = file("./scripts/sapinst.sh")
  disable_api_termination = "true"
  vpc_security_group_ids = [aws_security_group.allow_from_trust_to_seqdb.id]
  subnet_id = aws_subnet.LEGADMZ_A.id

  tags = {
    Name        = "sy-seqdb"
    Description = "DB서버"
    Environment = "Stg"
    cz-product  = "SAP"
    Schedule    = "samyang-office-hours"
    Snapshot    = "Yes"
    cz-ext1   = "sy-seqdb"
  }
}

resource "aws_volume_attachment" "seqdb_att_1" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.seqdb_add_1.id
  instance_id = aws_instance.seqdb.id
}

resource "aws_ebs_volume" "seqdb_add_1" {
  availability_zone = "${var.region}a"
  size              = 50
  type              = "gp3"
  tags = {
    Snapshot  = "true"
    Name      = "sy-seqdb"
    Partition = "seqdb"
    cz-ext1   = "sy-seqdb"
  }
}

resource "aws_volume_attachment" "seqdb_att_2" {
  device_name = "/dev/sdc"
  volume_id   = aws_ebs_volume.seqdb_add_2.id
  instance_id = aws_instance.seqdb.id
}

resource "aws_ebs_volume" "seqdb_add_2" {
  availability_zone = "${var.region}a"
  size              = 1230
  type              = "gp3"
  tags = {
    Snapshot  = "true"
    Name      = "sy-seqdb"
    Partition = "seqdb"
    cz-ext1   = "sy-seqdb"
  }
}
resource "aws_volume_attachment" "seqdb_att_3" {
  device_name = "/dev/sdd"
  volume_id   = aws_ebs_volume.seqdb_add_3.id
  instance_id = aws_instance.seqdb.id
}

resource "aws_ebs_volume" "seqdb_add_3" {
  availability_zone = "${var.region}a"
  size              = 512
  type              = "gp3"
  tags = {
    Snapshot  = "true"
    Name      = "sy-seqdb"
    Partition = "seqdb"
    cz-ext1   = "sy-seqdb"
  }
}
resource "aws_volume_attachment" "seqdb_att_4" {
  device_name = "/dev/sde"
  volume_id   = aws_ebs_volume.seqdb_add_4.id
  instance_id = aws_instance.seqdb.id
}

resource "aws_ebs_volume" "seqdb_add_4" {
  availability_zone = "${var.region}a"
  size              = 1024
  type              = "gp3"
  tags = {
    Snapshot  = "true"
    Name      = "sy-seqdb"
    Partition = "seqdb"
    cz-ext1   = "sy-seqdb"
  }
}

resource "aws_volume_attachment" "seqdb_att_5" {
  device_name = "/dev/sde"
  volume_id   = aws_ebs_volume.seqdb_add_5.id
  instance_id = aws_instance.seqdb.id
}

resource "aws_ebs_volume" "seqdb_add_5" {
  availability_zone = "${var.region}a"
  size              = 224
  type              = "gp3"
  tags = {
    Snapshot  = "true"
    Name      = "sy-seqdb-swap"
    Partition = "seqdb"
    cz-ext1   = "sy-seqdb"
  }
}