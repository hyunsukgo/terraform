
resource "aws_instance" "spddb" {
  ami           = "ami-097fc5cd098dd20d5" # ap-northeast-2
  instance_type = "r5.4xlarge"

  private_ip           = "10.200.30.45"
  key_name             = "samyangerp"
  iam_instance_profile = "ssm"

  root_block_device {
    volume_type = "gp3"
    volume_size = 30
    encrypted   = true
    kms_key_id  = aws_kms_key.ebs_kms.arn
    tags = {
      Name      = "sy-spo-spddb"
      Partition = "/root"
      cz-ext1   = "sy-spddb"
    }
  }
  user_data               = file("./scripts/sapinst.sh")
  disable_api_termination = "true"
  vpc_security_group_ids  = [aws_security_group.allow_from_trust_to_spddb.id]
  subnet_id               = aws_subnet.SAPDEV_A.id

  tags = {
    Name        = "sy-spo-spddb"
    Description = "DB서버"
    Environment = "Stg"
    cz-product  = "SAP"
    Schedule    = "samyang-office-hours-extend"
    Snapshot    = "Yes"
    cz-ext1     = "sy-spddb"
  }
}

resource "aws_volume_attachment" "spddb_att_1" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.spddb_add_1.id
  instance_id = aws_instance.spddb.id
}

resource "aws_ebs_volume" "spddb_add_1" {
  availability_zone = "${var.region}a"
  size              = 20
  iops              = 3000
  type              = "gp3"
  throughput        = 125
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-spo-spddb"
    Partition = "/usr/sap"
    cz-ext1   = "sy-spddb"
  }
}

resource "aws_volume_attachment" "spddb_att_2" {
  device_name = "/dev/sdc"
  volume_id   = aws_ebs_volume.spddb_add_2.id
  instance_id = aws_instance.spddb.id
}

resource "aws_ebs_volume" "spddb_add_2" {
  availability_zone = "${var.region}a"
  size              = 160
  iops              = 3000
  type              = "gp3"
  throughput        = 500
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-spo-spddb"
    Partition = "/hana/data"
    cz-ext1   = "sy-spddb"
  }
}

resource "aws_volume_attachment" "spddb_att_3" {
  device_name = "/dev/sdd"
  volume_id   = aws_ebs_volume.spddb_add_3.id
  instance_id = aws_instance.spddb.id
}

resource "aws_ebs_volume" "spddb_add_3" {
  availability_zone = "${var.region}a"
  size              = 64
  iops              = 3000
  type              = "gp3"
  throughput        = 125
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-spo-spddb"
    Partition = "/log"
    cz-ext1   = "sy-spddb"
  }
}

resource "aws_volume_attachment" "spddb_att_4" {
  device_name = "/dev/sde"
  volume_id   = aws_ebs_volume.spddb_add_4.id
  instance_id = aws_instance.spddb.id
}

resource "aws_ebs_volume" "spddb_add_4" {
  availability_zone = "${var.region}a"
  size              = 128
  iops              = 3000
  type              = "gp3"
  throughput        = 500
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-spo-spddb"
    Partition = "/hana/shared"  
    cz-ext1   = "sy-spddb"
  }
}

resource "aws_volume_attachment" "spddb_att_5" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.spddb_add_5.id
  instance_id = aws_instance.spddb.id
}

resource "aws_ebs_volume" "spddb_add_5" {
  availability_zone = "${var.region}a"
  size              = 64
  iops              = 3000
  type              = "gp3"
  throughput        = 125
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-spo-spddb"
    Partition = "/swap"  
    cz-ext1   = "sy-spddb"
  }
}