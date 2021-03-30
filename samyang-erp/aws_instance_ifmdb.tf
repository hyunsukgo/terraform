
resource "aws_instance" "ifmdb" {
  ami           = "ami-081511b9e3af53902" # ap-northeast-2
  instance_type = "r5.xlarge"
  private_ip           = "10.200.40.51"
  key_name             = "samyangerp"
  iam_instance_profile = "ssm"
  ebs_optimized = true
  root_block_device {
    volume_type = "gp2"
    volume_size = 30
    tags = {
      Name      = "sy-ifmdb"
      Partition = "ifmdb_root"
      cz-ext1   = "sy-ifmdb"
    }
  }
  user_data = file("./scripts/init.sh")
  disable_api_termination = "true"
  vpc_security_group_ids = [aws_security_group.allow_from_trust_to_ifmdb.id]
  subnet_id = aws_subnet.LEGADB1_A.id

  tags = {
    Name        = "sy-ifmdb"
    Description = "IF관리시스템"
    Environment = "Dev"
    cz-product  = "Non-SAP"
    Schedule    = "samyang-office-hours"
    Snapshot    = "Yes"
    cz-ext1   = "sy-ifmdb"
  }
}
## PostgreSQL DB Partition 
resource "aws_volume_attachment" "ifmdb_db_att" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.ifmdb_db_add.id
  instance_id = aws_instance.ifmdb.id
}

resource "aws_ebs_volume" "ifmdb_db_add" {
  availability_zone = "${var.region}a"
  size              = 100
  type              = "gp2"
  tags = {
    Snapshot  = "true"
    Name      = "sy-ifmdb"
    Partition = "ecccdev_postgresSQL"
    cz-ext1   = "sy-ifmdb"
  }
}
## Web Application Logs
resource "aws_volume_attachment" "ifmdb_weblog_att" {
  device_name = "/dev/sdc"
  volume_id   = aws_ebs_volume.ifmdb_weblog_add.id
  instance_id = aws_instance.ifmdb.id
}

resource "aws_ebs_volume" "ifmdb_weblog_add" {
  availability_zone = "${var.region}a"
  size              = 10
  type              = "gp2"
  tags = {
    Snapshot  = "true"
    Name      = "sy-ifmdb"
    Partition = "ecccdev_weblog"
    cz-ext1   = "sy-ifmdb"
  }
}
## Application Partition
resource "aws_volume_attachment" "ifmdb_app_att" {
  device_name = "/dev/sdd"
  volume_id   = aws_ebs_volume.ifmdb_app_add.id
  instance_id = aws_instance.ifmdb.id
}

resource "aws_ebs_volume" "ifmdb_app_add" {
  availability_zone = "${var.region}a"
  size              = 90
  type              = "gp2"
  tags = {
    Snapshot  = "true"
    Name      = "sy-ifmdb"
    Partition = "ecccdev_app"
    cz-ext1   = "sy-ifmdb"
  }
}
## WilyEM Partition
resource "aws_volume_attachment" "ifmdb_wilyem_att" {
  device_name = "/dev/sde"
  volume_id   = aws_ebs_volume.ifmdb_wilyem_add.id
  instance_id = aws_instance.ifmdb.id
}

resource "aws_ebs_volume" "ifmdb_wilyem_add" {
  availability_zone = "${var.region}a"
  size              = 50
  type              = "gp2"
  tags = {
    Snapshot  = "true"
    Name      = "sy-ifmdb"
    Partition = "ecccdev_app"
    cz-ext1   = "sy-ifmdb"
  }
}