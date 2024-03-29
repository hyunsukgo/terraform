
resource "aws_instance" "seqap" {
  ami           = "ami-097fc5cd098dd20d5" # ap-northeast-2
  instance_type = "m5.4xlarge"

  private_ip           = "10.200.30.14"
  key_name             = "samyangerp"
  iam_instance_profile = "ssm"

  root_block_device {
    volume_type = "gp3"
    volume_size = 30
    encrypted   = true
    kms_key_id  = aws_kms_key.ebs_kms.arn
    tags = {
      Name      = "sy-s4h-seqap"
      Partition = "/root"
      cz-ext1   = "sy-seqap"
    }
  }
  user_data               = file("./scripts/sapinst.sh")
  disable_api_termination = "true"
  vpc_security_group_ids  = [aws_security_group.S4H_DEV_QAS_AP.id]
  subnet_id               = aws_subnet.SAPDEV_A.id

  tags = {
    Name        = "sy-s4h-seqap"
    Description = "AP서버"
    Environment = "Stg"
    cz-product  = "SAP"
    #Schedule    = "samyang-office-hours-test"
    Snapshot = "Yes"
    cz-ext1  = "sy-seqap"
    map-sap  = "d-server-03o6dj6cmy1ps6"
  }
}

resource "aws_volume_attachment" "seqap_att_1" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.seqap_add_1.id
  instance_id = aws_instance.seqap.id
}

resource "aws_ebs_volume" "seqap_add_1" {
  availability_zone = "${var.region}a"
  size              = 10
  type              = "gp3"
  iops              = 3000
  throughput        = 125
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-s4h-seqap"
    Partition = "/sapmnt"
    cz-ext1   = "sy-seqap"
  }
}

resource "aws_volume_attachment" "seqap_att_2" {
  device_name = "/dev/sdc"
  volume_id   = aws_ebs_volume.seqap_add_2.id
  instance_id = aws_instance.seqap.id
}

resource "aws_ebs_volume" "seqap_add_2" {
  availability_zone = "${var.region}a"
  size              = 20
  type              = "gp3"
  iops              = 3000
  throughput        = 125
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-s4h-seqap"
    Partition = "/usr/sap"
    cz-ext1   = "sy-seqap"
  }
}
resource "aws_volume_attachment" "seqap_att_3" {
  device_name = "/dev/sde"
  volume_id   = aws_ebs_volume.seqap_add_3.id
  instance_id = aws_instance.seqap.id
}

resource "aws_ebs_volume" "seqap_add_3" {
  availability_zone = "${var.region}a"
  size              = 96
  type              = "gp3"
  iops              = 3000
  throughput        = 125
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-s4h-seqap"
    Partition = "/swap"
    cz-ext1   = "sy-seqap"
  }
}

resource "aws_volume_attachment" "endb_att" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.endb_add.id
  instance_id = aws_instance.seqap.id
}

resource "aws_ebs_volume" "endb_add" {
  availability_zone = "${var.region}a"
  size              = 10
  type              = "gp3"
  iops              = 3000
  throughput        = 125
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-s4h-seqap"
    Partition = "/EnDB"
    cz-ext1   = "sy-seqap"
  }
}