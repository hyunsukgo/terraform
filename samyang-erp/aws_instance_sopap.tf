
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
    volume_size = 40
    tags = {
      Name      = "sy-sopap"
      Partition = "sopap_C"
      cz-ext1   = "sy-sopap"
    }
  }
  disable_api_termination = "true"
  vpc_security_group_ids  = [aws_security_group.allow_from_trust_to_sopap.id]
  subnet_id               = aws_subnet.LEGAAP1_A.id

  tags = {
    Name        = "sy-sopap"
    Description = "S&OP(AP)"
    Environment = "Prd"
    cz-product  = "Non-SAP"
    Schedule    = "samyang-office-hours"
    Snapshot    = "Yes"
    cz-ext1     = "sy-sopap"
  }
}
