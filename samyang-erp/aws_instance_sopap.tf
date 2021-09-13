
resource "aws_instance" "sopap" {
  ami                  = "ami-0bbac56d527e97165" # ap-northeast-2
  instance_type        = "m5.4xlarge"
  ebs_optimized        = true
  private_ip           = "10.200.50.11"
  key_name             = "samyangerp"
  iam_instance_profile = "ssm"

  root_block_device {
    volume_type = "gp3"
    iops        = 3000
    throughput  = 125
    volume_size = 50
    tags = {
      Name      = "sy-leg-sopap"
      Partition = "sopap_C"
      cz-ext1   = "sy-sopap"
    }
  }
  disable_api_termination = "true"
  vpc_security_group_ids  = [aws_security_group.allow_from_trust_to_sopap.id]
  subnet_id               = aws_subnet.LEGAAP1_A.id

  tags = {
    Name        = "sy-leg-sopap"
    Description = "S&OP(AP)"
    Environment = "Prd"
    cz-product  = "Non-SAP"
    #Schedule    = "samyang-office-hours"
    Snapshot = "Yes"
    cz-ext1  = "sy-sopap"
  }
}


resource "aws_volume_attachment" "sopap_att" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.sopap_add.id
  instance_id = aws_instance.sopap.id
}

resource "aws_ebs_volume" "sopap_add" {
  availability_zone = "${var.region}a"
  size              = 300
  type              = "gp3"
  iops              = 3000
  throughput        = 125
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-leg-sopap"
    Partition = "sopap_D"
    cz-ext1   = "sy-sopap"
  }
}