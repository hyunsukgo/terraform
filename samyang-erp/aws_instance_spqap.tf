
resource "aws_instance" "spqap" {
  ami           = "ami-097fc5cd098dd20d5" # ap-northeast-2
  instance_type = "r5.xlarge"

  private_ip           = "10.200.30.43"
  key_name             = "samyangerp"
  iam_instance_profile = "ssm"

  root_block_device {
    volume_type = "gp3"
    volume_size = 30
    iops        = 3000
    throughput  = 125
    encrypted   = true
    kms_key_id  = aws_kms_key.ebs_kms.arn
    tags = {
      Name      = "sy-spo-spqdb"
      Partition = "/root"
      cz-ext1   = "sy-spqdb"
    }
  }
  user_data               = file("./scripts/sapinst.sh")
  disable_api_termination = "true"
  vpc_security_group_ids  = [aws_security_group.allow_from_trust_to_spqap.id]
  subnet_id               = aws_subnet.SAPDEV_A.id

  tags = {
    Name        = "sy-spo-spqdb"
    Description = "AP서버"
    Environment = "Stg"
    cz-product  = "SAP"
    Schedule    = "samyang-office-hours-test"
    Snapshot    = "Yes"
    cz-ext1     = "sy-spqdb"
  }
}

resource "aws_volume_attachment" "spqap_att_1" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.spqap_add_1.id
  instance_id = aws_instance.spqap.id
}

resource "aws_ebs_volume" "spqap_add_1" {
  availability_zone = "${var.region}a"
  size              = 100
  type              = "gp3"
  throughput        = 500
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-spo-spqdb"
    Partition = "/sybase"
    cz-ext1   = "sy-spqdb"
  }
}

resource "aws_volume_attachment" "spqap_att_2" {
  device_name = "/dev/sde"
  volume_id   = aws_ebs_volume.spqap_add_2.id
  instance_id = aws_instance.spqap.id
}

resource "aws_ebs_volume" "spqap_add_2" {
  availability_zone = "${var.region}a"
  size              = 64
  type              = "gp3"
  iops              = 3000
  throughput        = 125
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-spo-spqdb"
    Partition = "/swap"
    cz-ext1   = "sy-spqdb"
  }
}

resource "aws_volume_attachment" "spqdb_att_4" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.spqdb_add_4.id
  instance_id = aws_instance.spqap.id
}

resource "aws_ebs_volume" "spqdb_add_4" {
  availability_zone = "${var.region}a"
  size              = 128
  iops              = 3000
  type              = "gp3"
  throughput        = 500
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-spo-spqdb"
    Partition = "/hana/shared/SPD"
    cz-ext1   = "sy-spqdb"
  }
}


resource "aws_volume_attachment" "spqdb_att_5" {
  device_name = "/dev/sdg"
  volume_id   = aws_ebs_volume.spqdb_add_5.id
  instance_id = aws_instance.spqap.id
}

resource "aws_ebs_volume" "spqdb_add_5" {
  availability_zone = "${var.region}a"
  size              = 256
  iops              = 3000
  type              = "gp3"
  throughput        = 500
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-spo-spqdb"
    Partition = "/hana/data/SPD"
    cz-ext1   = "sy-spqdb"
  }
}

resource "aws_volume_attachment" "spqdb_att_6" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.spqdb_add_6.id
  instance_id = aws_instance.spqap.id
}

resource "aws_ebs_volume" "spqdb_add_6" {
  availability_zone = "${var.region}a"
  size              = 64
  iops              = 3000
  type              = "gp3"
  throughput        = 500
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-spo-spqdb"
    Partition = "/hana/log/SPD"
    cz-ext1   = "sy-spqdb"
  }
}

resource "aws_volume_attachment" "spqdb_att_7" {
  device_name = "/dev/sdi"
  volume_id   = aws_ebs_volume.spqdb_add_7.id
  instance_id = aws_instance.spqap.id
}

resource "aws_ebs_volume" "spqdb_add_7" {
  availability_zone = "${var.region}a"
  size              = 20
  iops              = 3000
  type              = "gp3"
  throughput        = 125
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-spo-spqdb"
    Partition = "/usr/sap/SPD"
    cz-ext1   = "sy-spqdb"
  }
}

resource "aws_volume_attachment" "spqdb_att_8" {
  device_name = "/dev/sdj"
  volume_id   = aws_ebs_volume.spqdb_add_8.id
  instance_id = aws_instance.spqap.id
}

resource "aws_ebs_volume" "spqdb_add_8" {
  availability_zone = "${var.region}a"
  size              = 128
  iops              = 3000
  type              = "gp3"
  throughput        = 500
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-spo-spqdb"
    Partition = "/hana/shared/SPQ"
    cz-ext1   = "sy-spqdb"
  }
}


resource "aws_volume_attachment" "spqdb_att_9" {
  device_name = "/dev/sdk"
  volume_id   = aws_ebs_volume.spqdb_add_9.id
  instance_id = aws_instance.spqap.id
}

resource "aws_ebs_volume" "spqdb_add_9" {
  availability_zone = "${var.region}a"
  size              = 256
  iops              = 3000
  type              = "gp3"
  throughput        = 500
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-spo-spqdb"
    Partition = "/hana/data/SPQ"
    cz-ext1   = "sy-spqdb"
  }
}

resource "aws_volume_attachment" "spqdb_att_10" {
  device_name = "/dev/sdl"
  volume_id   = aws_ebs_volume.spqdb_add_10.id
  instance_id = aws_instance.spqap.id
}

resource "aws_ebs_volume" "spqdb_add_10" {
  availability_zone = "${var.region}a"
  size              = 64
  iops              = 3000
  type              = "gp3"
  throughput        = 500
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-spo-spqdb"
    Partition = "/hana/log/SPQ"
    cz-ext1   = "sy-spqdb"
  }
}

resource "aws_volume_attachment" "spqdb_att_11" {
  device_name = "/dev/sdm"
  volume_id   = aws_ebs_volume.spqdb_add_11.id
  instance_id = aws_instance.spqap.id
}

resource "aws_ebs_volume" "spqdb_add_11" {
  availability_zone = "${var.region}a"
  size              = 20
  iops              = 3000
  type              = "gp3"
  throughput        = 125
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-spo-spqdb"
    Partition = "/usr/sap/SPQ"
    cz-ext1   = "sy-spqdb"
  }
}