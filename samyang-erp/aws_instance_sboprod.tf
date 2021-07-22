
resource "aws_instance" "sboprod" {
  ami                  = "ami-0fc1ba861e48fc890" # ap-northeast-2
  instance_type        = "r5.4xlarge"
  ebs_optimized        = true
  private_ip           = "10.200.10.31"
  key_name             = "samyangerp"
  iam_instance_profile = "ssm"

  root_block_device {
    volume_type = "gp3"
    iops        = 3000
    throughput  = 125
    volume_size = 40
    tags = {
      Name      = "sy-sboprod"
      Partition = "sboprod_C"
      cz-ext1   = "sy-sboprod"
    }
  }
  disable_api_termination = "true"
  vpc_security_group_ids  = [aws_security_group.allow_from_trust_to_sboprod.id]
  subnet_id               = aws_subnet.SAPDB_A.id

  tags = {
    Name        = "sy-sboprod"
    Description = "S&OP(DB)"
    Environment = "Prd"
    cz-product  = "Non-SAP"
    Schedule    = "samyang-office-hours"
    Snapshot    = "Yes"
    cz-ext1     = "sy-sboprod"
  }
}

resource "aws_volume_attachment" "sboprod_att" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.sboprod_add.id
  instance_id = aws_instance.sboprod.id
}

resource "aws_ebs_volume" "sboprod_add" {
  availability_zone = "${var.region}a"
  size              = 60
  iops              = 3000
  throughput        = 125
  type              = "gp3"
  tags = {
    Snapshot  = "true"
    Name      = "sy-sboprod"
    Partition = "sboprod_D"
    cz-ext1   = "sy-sboprod"
  }
}
