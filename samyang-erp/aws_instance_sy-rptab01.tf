resource "aws_instance" "rptab01" {
  ami           = "ami-0fc1ba861e48fc890" # ap-northeast-2
  instance_type = "r5.2xlarge"

  private_ip           = "10.200.50.41"
  key_name             = "samyangerp"
  iam_instance_profile = "ssm"

  root_block_device {
    volume_type = "gp3"
    iops        = 3000
    throughput  = 125
    volume_size = 50
    tags = {
      Name      = "sy-leg-rptap01"
      Partition = "rptap01_C"
      cz-ext1   = "sy-rptap01"
    }
  }
  disable_api_termination = "true"
  vpc_security_group_ids  = [aws_security_group.allow_from_trust_to_rptab.id]
  subnet_id               = aws_subnet.LEGAAP1_A.id

  tags = {
    Name        = "sy-leg-rptap01"
    Description = "리포트서버"
    Environment = "Prd"
    cz-product  = "Non-SAP"
    #Schedule    = "" #"samyang-office-hours-noholiday"
    Snapshot = "Yes"
    cz-ext1  = "sy-rptap01"
  }
}

resource "aws_volume_attachment" "rptab01_att" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.rptab01_add.id
  instance_id = aws_instance.rptab01.id
}

resource "aws_ebs_volume" "rptab01_add" {
  availability_zone = "${var.region}a"
  size              = 50
  iops              = 3000
  throughput        = 125
  type              = "gp3"
  tags = {
    Snapshot  = "true"
    Name      = "sy-leg-rptap01"
    Partition = "rptap01_D"
    cz-ext1   = "sy-rptap01"
  }
}