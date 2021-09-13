
resource "aws_instance" "casap" {
  ami           = "ami-01dd8a88a17ff5466" # ap-northeast-2 / 20210830
  instance_type = "c5.2xlarge"

  private_ip           = "10.200.50.21"
  key_name             = "samyangerp"
  iam_instance_profile = "ssm"

  root_block_device {
    volume_type = "gp3"
    throughput  = 125
    iops        = 3000
    volume_size = 100
    encrypted   = true
    kms_key_id  = aws_kms_key.ebs_kms.arn
    tags = {
      Name      = "sy-casap"
      Partition = "/root"
      cz-ext1   = "sy-casap"
    }
  }
  user_data               = file("./scripts/wininst.sh")
  disable_api_termination = "true"
  vpc_security_group_ids  = [aws_security_group.allow_from_trust_to_casap.id]
  subnet_id               = aws_subnet.LEGAAP1_A.id

  tags = {
    Name        = "sy-leg-casap"
    Description = "연결회계"
    Environment = "Prd"
    cz-product  = "Non-SAP"
    Snapshot    = "Yes"
    cz-ext1     = "sy-casap"
  }
}


resource "aws_volume_attachment" "casap_att" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.casap_add.id
  instance_id = aws_instance.casap.id
}

resource "aws_ebs_volume" "casap_add" {
  availability_zone = "${var.region}a"
  size              = 150
  iops              = 3000
  throughput        = 125
  type              = "gp3"
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-casap"
    Partition = "casap_D"
    cz-ext1   = "sy-casap"
  }
}