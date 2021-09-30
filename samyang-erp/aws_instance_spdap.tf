
resource "aws_instance" "spdap" {
  ami           = "ami-097fc5cd098dd20d5" # ap-northeast-2
  instance_type = "r5.xlarge"

  private_ip           = "10.200.30.42"
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
      Name      = "sy-spo-spdap"
      Partition = "/root"
      cz-ext1   = "sy-spdap"
    }
  }
  user_data               = file("./scripts/sapinst.sh")
  disable_api_termination = "true"
  vpc_security_group_ids  = [aws_security_group.PO_DEV_QAS_AP.id]
  subnet_id               = aws_subnet.SAPDEV_A.id

  tags = {
    Name        = "sy-spo-spdap"
    Description = "AP서버"
    Environment = "Stg"
    cz-product  = "SAP"
    #Schedule    = "samyang-office-hours-extend"
    Snapshot = "Yes"
    cz-ext1  = "sy-spdap"
    map-sap  = "d-server-03o6dj6cmy1ps6"
  }
}

resource "aws_volume_attachment" "spdap_att_1" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.spdap_add_1.id
  instance_id = aws_instance.spdap.id
}

resource "aws_ebs_volume" "spdap_add_1" {
  availability_zone = "${var.region}a"
  size              = 10
  type              = "gp3"
  throughput        = 500
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-spo-spdap"
    Partition = "/sapmnt"
    cz-ext1   = "sy-spdap"
  }
}

resource "aws_volume_attachment" "spdap_att_2" {
  device_name = "/dev/sdc"
  volume_id   = aws_ebs_volume.spdap_add_2.id
  instance_id = aws_instance.spdap.id
}

resource "aws_ebs_volume" "spdap_add_2" {
  availability_zone = "${var.region}a"
  size              = 20
  type              = "gp3"
  iops              = 3000
  throughput        = 125
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-spo-spdap"
    Partition = "/usr/sap"
    cz-ext1   = "sy-spdap"
  }
}

resource "aws_volume_attachment" "spdap_att_3" {
  device_name = "/dev/sdd"
  volume_id   = aws_ebs_volume.spdap_add_3.id
  instance_id = aws_instance.spdap.id
}

resource "aws_ebs_volume" "spdap_add_3" {
  availability_zone = "${var.region}a"
  size              = 10
  type              = "gp3"
  iops              = 3000
  throughput        = 125
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-spo-spdap"
    Partition = "heapdump"
    cz-ext1   = "sy-spdap"
  }
}


resource "aws_volume_attachment" "spdap_att_4" {
  device_name = "/dev/sde"
  volume_id   = aws_ebs_volume.spdap_add_4.id
  instance_id = aws_instance.spdap.id
}

resource "aws_ebs_volume" "spdap_add_4" {
  availability_zone = "${var.region}a"
  size              = 64
  type              = "gp3"
  iops              = 3000
  throughput        = 125
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-spo-spdap"
    Partition = "/swap"
    cz-ext1   = "sy-spdap"
  }
}