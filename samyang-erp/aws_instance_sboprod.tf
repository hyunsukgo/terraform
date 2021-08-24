
resource "aws_instance" "sboprod" {
  ami                  = "ami-0bbac56d527e97165" # ap-northeast-2
  instance_type        = "r5.4xlarge"
  ebs_optimized        = true
  private_ip           = "10.200.10.31"
  key_name             = "samyangerp"
  iam_instance_profile = "ssm"

  root_block_device {
    volume_type = "gp3"
    iops        = 3000
    throughput  = 125
    volume_size = 100
    tags = {
      Name      = "sy-sbo-sboprod"
      Partition = "sboprod_C"
      cz-ext1   = "sy-sboprod"
    }
  }
  disable_api_termination = "true"
  vpc_security_group_ids  = [aws_security_group.allow_from_trust_to_sboprod.id]
  subnet_id               = aws_subnet.SAPDB1_A.id

  tags = {
    Name        = "sy-sbo-sboprod"
    Description = "S&OP(DB)"
    Environment = "Prd"
    cz-product  = "Non-SAP"
    #Schedule    = ""
    Snapshot = "Yes"
    cz-ext1  = "sy-sboprod"
  }
}


resource "aws_volume_attachment" "sboprod_att" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.sboprod_add.id
  instance_id = aws_instance.sboprod.id
}

resource "aws_ebs_volume" "sboprod_add" {
  availability_zone = "${var.region}a"
  size              = 300
  type              = "gp3"
  iops              = 3000
  throughput        = 125
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_kms.arn
  tags = {
    Snapshot  = "true"
    Name      = "sy-sbo-sboprod"
    Partition = "sboprod D:"
    cz-ext1   = "sy-sboprod"
  }
}