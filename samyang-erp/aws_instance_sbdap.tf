
resource "aws_instance" "sbdap" {
  ami           = "ami-097fc5cd098dd20d5" # ap-northeast-2
  instance_type = "m5.4xlarge"

  private_ip           = "10.200.30.22"
  key_name             = "samyangerp"
  iam_instance_profile = "ssm"
 
  root_block_device {
    volume_type = "gp2"
    volume_size = 30
    tags = {
      Name      = "sy-sbdap"
      Partition = "sbdap_root"
      cz-ext1   = "sy-sbdap"
    }
  }
  #user_data = file("./scripts/sapinst.sh")
  disable_api_termination = "true"
  vpc_security_group_ids = [aws_security_group.allow_from_trust_to_bw_ap.id]
  subnet_id = aws_subnet.SAPDEV_A.id

  tags = {
    Name        = "sy-sbdap"
    Description = "AP 서버 #1"
    Environment = "Dev"
    cz-product  = "SAP"
    Schedule    = "samyang-office-hours"
    Snapshot    = "Yes"
    cz-ext1   = "sy-sbdap"
  }
}
## /sapmnt Partitioning
resource "aws_volume_attachment" "sbdap_sapmnt_att" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.sbdap_sapmnt_add.id
  instance_id = aws_instance.sbdap.id
}

resource "aws_ebs_volume" "sbdap_sapmnt_add" {
  availability_zone = "${var.region}a"
  size              = 10
  type              = "gp2"
  tags = {
    Snapshot  = "true"
    Name      = "sy-sbdap"
    Partition = "sbdap_sapmnt"
    cz-ext1   = "sy-sbdap"
  }
}
## /usr/sap Partitioning
resource "aws_volume_attachment" "sbdap_usrsap_att" {
  device_name = "/dev/sdc"
  volume_id   = aws_ebs_volume.sbdap_usrsap_add.id
  instance_id = aws_instance.sbdap.id
}

resource "aws_ebs_volume" "sbdap_usrsap_add" {
  availability_zone = "${var.region}a"
  size              = 20
  type              = "gp2"
  tags = {
    Snapshot  = "true"
    Name      = "sy-sbdap"
    Partition = "sbdap_usrsap"
    cz-ext1   = "sy-sbdap"
  }
}
## /usr/sap/trans Partitioning
resource "aws_volume_attachment" "sbdap_usrsaptrans_att" {
  device_name = "/dev/sdd"
  volume_id   = aws_ebs_volume.sbdap_usrsaptrans_add.id
  instance_id = aws_instance.sbdap.id
}

resource "aws_ebs_volume" "sbdap_usrsaptrans_add" {
  availability_zone = "${var.region}a"
  size              = 50
  type              = "gp2"
  tags = {
    Snapshot  = "true"
    Name      = "sy-sbdap"
    Partition = "sbdap_usrsaptrans"
    cz-ext1   = "sy-sbdap"
  }
}
## /SAPCD Partitioning
resource "aws_volume_attachment" "sbdap_sapcd_att" {
  device_name = "/dev/sde"
  volume_id   = aws_ebs_volume.sbdap_sapcd_add.id
  instance_id = aws_instance.sbdap.id
}

resource "aws_ebs_volume" "sbdap_sapcd_add" {
  availability_zone = "${var.region}a"
  size              = 300
  type              = "gp2"
  tags = {
    Snapshot  = "true"
    Name      = "sy-sbdap"
    Partition = "sbdap_sapcd_add"
    cz-ext1   = "sy-sbdap"
  }
}
## Swap Disk
resource "aws_volume_attachment" "sbdap_swap_att" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.sbdap_swap_add.id
  instance_id = aws_instance.sbdap.id
}

resource "aws_ebs_volume" "sbdap_swap_add" {
  availability_zone = "${var.region}a"
  size              = 96
  type              = "gp2"
  tags = {
    Snapshot  = "true"
    Name      = "sy-sbdap"
    Partition = "sbdap_swap_add"
    cz-ext1   = "sy-sbdap"
  }
}