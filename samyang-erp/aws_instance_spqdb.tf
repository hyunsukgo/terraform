
resource "aws_instance" "spqdb" {
  ami           = "ami-097fc5cd098dd20d5" # ap-northeast-2
  instance_type = "r5.xlarge"

  private_ip           = "10.200.30.44"
  key_name             = "samyangerp"
  iam_instance_profile = "ssm"

  root_block_device {
    volume_type = "gp3"
    volume_size = 30
    encrypted   = true
    kms_key_id  = aws_kms_key.ebs_kms.arn
    tags = {
      Name      = "sy-spqap"
      Partition = "spqdb_root"
      cz-ext1   = "sy-spqap"
    }
  }
  user_data               = file("./scripts/sapinst.sh")
  disable_api_termination = "true"
  vpc_security_group_ids  = [aws_security_group.allow_from_trust_to_spqdb.id]
  subnet_id               = aws_subnet.SAPDEV_A.id

  tags = {
    Name        = "sy-spqap"
    Description = "AP서버"
    Environment = "Stg"
    cz-product  = "SAP"
    Schedule    = "samyang-office-hours"
    Snapshot    = "Yes"
    cz-ext1     = "sy-spqap"
  }
}

resource "aws_volume_attachment" "spqdb_att_1" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.spqdb_add_1.id
  instance_id = aws_instance.spqdb.id
}

resource "aws_ebs_volume" "spqdb_add_1" {
  availability_zone = "${var.region}a"
  size              = 10
  type              = "gp3"
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-spqap"
    Partition = "spqap"
    cz-ext1   = "sy-spqap"
  }
}

resource "aws_volume_attachment" "spqdb_att_2" {
  device_name = "/dev/sdc"
  volume_id   = aws_ebs_volume.spqdb_add_2.id
  instance_id = aws_instance.spqdb.id
}

resource "aws_ebs_volume" "spqdb_add_2" {
  availability_zone = "${var.region}a"
  size              = 20
  type              = "gp3"
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-spqap"
    Partition = "spqap"
    cz-ext1   = "sy-spqap"
  }
}
resource "aws_volume_attachment" "spqdb_att_3" {
  device_name = "/dev/sde"
  volume_id   = aws_ebs_volume.spqdb_add_3.id
  instance_id = aws_instance.spqdb.id
}

resource "aws_ebs_volume" "spqdb_add_3" {
  availability_zone = "${var.region}a"
  size              = 64
  type              = "gp3"
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-spqap-swap"
    Partition = "spqap"
    cz-ext1   = "sy-spqap"
  }
}