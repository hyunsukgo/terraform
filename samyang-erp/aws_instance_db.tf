/*
resource "aws_instance" "sapdb" {
  ami           = "ami-097fc5cd098dd20d5"
  instance_type = "r5.8xlarge"
  private_ip = "10.200.30.11"
  #security_groups = [aws_security_group.allow_ssh_from_vpn.id]
  root_block_device {
    volume_size = 30
    volume_type = "gp3"  
  }
  tags = {
    Name = "sapdb1"
    Enviroment = "Dev"
  }
  key_name = "samyangerp"
  associate_public_ip_address = false
  #user_data = "${file("sapinst.sh")}"
  subnet_id = aws_subnet.SAPDEV_A.id
}

resource "aws_volume_attachment" "usrsap_db_att" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.usrsap_db.id
  instance_id = aws_instance.sapdb.id
}
resource "aws_volume_attachment" "hanadata_att" {
  device_name = "/dev/sdc"
  volume_id   = aws_ebs_volume.hanadata.id
  instance_id = aws_instance.sapdb.id
}
resource "aws_volume_attachment" "hanalog_att" {
  device_name = "/dev/sdd"
  volume_id   = aws_ebs_volume.hanalog.id
  instance_id = aws_instance.sapdb.id
}
resource "aws_volume_attachment" "hanashared_att" {
  device_name = "/dev/sde"
  volume_id   = aws_ebs_volume.hanashared.id
  instance_id = aws_instance.sapdb.id
}

resource "aws_volume_attachment" "sapcd_db_att" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.sapcd-db.id
  instance_id = aws_instance.sapdb.id
}

resource "aws_volume_attachment" "swap_att" {
  device_name = "/dev/sdg"
  volume_id   = aws_ebs_volume.swap-db.id
  instance_id = aws_instance.sapdb.id
}

resource "aws_ebs_volume" "usrsap_db" {
  availability_zone = "${var.region}a"
  size              = 20
  type              = "gp3"
  tags = {
    Snapshot = "true"
  }
}

resource "aws_ebs_volume" "hanadata" {
  availability_zone = "${var.region}a"
  size              = 310
  type              = "gp3"
  tags = {
    Snapshot = "true"
  }
}

/*
resource "aws_ebs_volume" "hanalog" {
  availability_zone = "${var.region}a"
  size              = 128
  type              = "gp3"
  tags = {
    Snapshot = "true"
  }
}
resource "aws_ebs_volume" "hanashared" {
  availability_zone = "${var.region}a"
  size              = 256
  type              = "gp3"
  tags = {
    Snapshot = "true"
  }
}

resource "aws_ebs_volume" "sapcd-db" {
  availability_zone = "${var.region}a"
  size              = 300
  type              = "gp3"
  tags = {
    Snapshot = "true"
  }
}
/*
resource "aws_ebs_volume" "swap-db" {
  availability_zone = "${var.region}a"
  size              = 160
  type              = "gp3"
  tags = {
    Snapshot = "true"
  }
}
*/
resource "aws_ebs_volume" "endb" {
  availability_zone = "${var.region}a"
  size              = 10
  type              = "gp2"
  tags = {
    Name     = "${var.service_name}-endb"
    Snapshot = "true"
  }
}