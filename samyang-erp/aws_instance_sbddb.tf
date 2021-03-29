/*
resource "aws_instance" "sbddb" {
  ami           = "ami-097fc5cd098dd20d5" # ap-northeast-2
  instance_type = "x1.16xlarge"

  private_ip           = "10.200.30.21"
  key_name             = "samyangerp"
  iam_instance_profile = "ssm"

  root_block_device {
    volume_type = "gp2"
    volume_size = 30
    tags = {
      Name      = "sy-sbddb"
      Partition = "sbddb_root"
      cz-ext1   = "sy-sbddb"
    }
  }
  user_data = file("./scripts/sapinst.sh")
  disable_api_termination = "true"
  security_groups = [aws_security_group.allow_from_trust_to_bw_db.id]
  subnet_id = aws_subnet.SAPDEV_A.id

  tags = {
    Name        = "sy-sbddb"
    Description = "DB 서버"
    Environment = "Dev"
    cz-product  = "SAP"
    Schedule    = "samyang-office-hours"
    Snapshot    = "Yes"
    cz-ext1   = "sy-sbddb"
  }
}
*/
/*
## /usr/sap Partitioning
resource "aws_volume_attachment" "sbddb_usrsap_att" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.sbddb_usrsap_add.id
  instance_id = aws_instance.sbddb.id
}
*/
resource "aws_ebs_volume" "sbddb_usrsap_add" {
  availability_zone = "${var.region}a"
  size              = 20
  type              = "gp2"
  tags = {
    Snapshot  = "true"
    Name      = "sy-sbddb"
    Partition = "sbddb_usrsap"
    cz-ext1   = "sy-sbddb"
  }
}
/*
## /hana/data Partitioning
resource "aws_volume_attachment" "sbddb_hanadata_att" {
  device_name = "/dev/sdc"
  volume_id   = aws_ebs_volume.sbddb_hanadata_add.id
  instance_id = aws_instance.sbddb.id
}
*/
resource "aws_ebs_volume" "sbddb_hanadata_add" {
  availability_zone = "${var.region}a"
  size              = 620
  type              = "gp2"
  tags = {
    Snapshot  = "true"
    Name      = "sy-sbddb"
    Partition = "sbddb_hanadata"
    cz-ext1   = "sy-sbddb"
  }
}
/*
## /hana/log Partitioning
resource "aws_volume_attachment" "sbddb_hanalog_att" {
  device_name = "/dev/sdd"
  volume_id   = aws_ebs_volume.sbddb_hanalog_add.id
  instance_id = aws_instance.sbddb.id
}
*/
resource "aws_ebs_volume" "sbddb_hanalog_add" {
  availability_zone = "${var.region}a"
  size              = 256
  type              = "gp2"
  tags = {
    Snapshot  = "true"
    Name      = "sy-sbddb"
    Partition = "sbddb_hanalog"
    cz-ext1   = "sy-sbddb"
  }
}
/*
## /hana/shared Partitioning
resource "aws_volume_attachment" "sbddb_hanashared_att" {
  device_name = "/dev/sde"
  volume_id   = aws_ebs_volume.sbddb_hanashared_add.id
  instance_id = aws_instance.sbddb.id
}
*/
resource "aws_ebs_volume" "sbddb_hanashared_add" {
  availability_zone = "${var.region}a"
  size              = 512
  type              = "gp2"
  tags = {
    Snapshot  = "true"
    Name      = "sy-sbddb"
    Partition = "sbddb_hanashared_add"
    cz-ext1   = "sy-sbddb"
  }
}
/*
## /SAPCD Partitioning
resource "aws_volume_attachment" "sbddb_sapcd_att" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.sbddb_sapcd_add.id
  instance_id = aws_instance.sbddb.id
}
*/
resource "aws_ebs_volume" "sbddb_sapcd_add" {
  availability_zone = "${var.region}a"
  size              = 300
  type              = "gp2"
  tags = {
    Snapshot  = "true"
    Name      = "sy-sbdap"
    Partition = "sbddb_sapcd_add"
    cz-ext1   = "sy-sbdap"
  }
}
