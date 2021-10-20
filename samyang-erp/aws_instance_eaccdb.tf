resource "aws_instance" "eaccdb" {
  ami                  = "ami-0fc1ba861e48fc890" # ap-northeast-2
  instance_type        = "m5.2xlarge"
  ebs_optimized        = true
  private_ip           = "10.200.50.251"
  key_name             = "samyangerp"
  iam_instance_profile = "ssm"

  root_block_device {
    volume_type = "gp3"
    iops        = 3000
    throughput  = 125
    volume_size = 50
    tags = {
      Name      = "sy-leg-eaccdb"
      Partition = "ecccdb_C"
      cz-ext1   = "sy-eaccdb"
    }
  }
  disable_api_termination = "true"
  vpc_security_group_ids  = [aws_security_group.allow_from_trust_to_eaccdb.id]
  subnet_id               = aws_subnet.LEGADMZ_A.id

  tags = {
    Name        = "sy-leg-eaccdb"
    Description = "전자전표(DB)"
    Environment = "Dev"
    cz-product  = "Non-SAP"
    #Schedule    = "samyang-office-hours"
    Snapshot = "Yes"
    cz-ext1  = "sy-eaccdb"
  }
}

resource "aws_volume_attachment" "eaccdb_att" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.eaccdb_add.id
  instance_id = aws_instance.eaccdb.id
}

resource "aws_ebs_volume" "eaccdb_add" {
  availability_zone = "${var.region}a"
  size              = 100
  iops              = 3000
  throughput        = 125
  type              = "gp3"
  tags = {
    Snapshot  = "true"
    Name      = "sy-leg-eaccdb"
    Partition = "ecccdb_D"
    cz-ext1   = "sy-eaccdb"
  }
}

resource "aws_eip" "eaccdb_eip" {
  vpc = true
  #instance = aws_instance.eaccdb.id
  tags = {
    Name        = "${var.service_name}-eaccdb-EIP"
    Description = "전자전표 공인 IP"
  }
}