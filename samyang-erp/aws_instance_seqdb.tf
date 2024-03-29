
resource "aws_instance" "seqdb" {
  ami           = "ami-097fc5cd098dd20d5" # ap-northeast-2
  instance_type = "x1.16xlarge"

  private_ip           = "10.200.30.13"
  key_name             = "samyangerp"
  iam_instance_profile = "ssm"

  root_block_device {
    volume_type = "gp3"
    volume_size = 30
    encrypted   = true
    kms_key_id  = aws_kms_key.ebs_kms.arn
    tags = {
      Name      = "sy-s4h-seqdb"
      Partition = "/root"
      cz-ext1   = "sy-seqdb"
    }
  }
  user_data               = file("./scripts/sapinst.sh")
  disable_api_termination = "true"
  vpc_security_group_ids  = [aws_security_group.S4H_DEV_QAS_DB.id]
  subnet_id               = aws_subnet.SAPDEV_A.id

  tags = {
    Name        = "sy-s4h-seqdb"
    Description = "DB서버"
    Environment = "Stg"
    cz-product  = "SAP"
    #Schedule    = "samyang-office-hours-test"
    Snapshot = "Yes"
    cz-ext1  = "sy-seqdb"
    map-sap  = "d-server-03o6dj6cmy1ps6"
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
  throughput        = 125
  iops              = 3000
  type              = "gp3"
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-s4h-seqdb"
    Partition = "/usr/sap"
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
  iops              = 3000
  throughput        = 500
  type              = "gp3"
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-s4h-seqdb"
    Partition = "/hana/data"
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
  iops              = 3000
  throughput        = 500
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-s4h-seqdb"
    Partition = "/hana/log"
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
  iops              = 3000
  throughput        = 500
  type              = "gp3"
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-s4h-seqdb"
    Partition = "/hana/shared"
    cz-ext1   = "sy-seqdb"
  }
}

resource "aws_volume_attachment" "seqdb_att_5" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.seqdb_add_5.id
  instance_id = aws_instance.seqdb.id
}

resource "aws_ebs_volume" "seqdb_add_5" {
  availability_zone = "${var.region}a"
  size              = 224
  type              = "gp3"
  iops              = 3000
  throughput        = 125
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-s4h-seqdb"
    Partition = "/swap"
    cz-ext1   = "sy-seqdb"
  }
}