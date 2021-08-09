
resource "aws_instance" "firmbkap" {
  ami           = "ami-0133b1a5b9ca9be36" # ap-northeast-2
  instance_type = "m5.large"

  private_ip           = "10.200.50.81"
  key_name             = "samyangerp"
  iam_instance_profile = "ssm"

  root_block_device {
    volume_type = "gp3"
    throughput  = 125
    iops        = 3000
    volume_size = 100
    tags = {
      Name      = "sy-firmbkap"
      Partition = "/root"
      cz-ext1   = "sy-firmbkap"
    }
  }
  user_data               = file("./scripts/wininst.sh")
  disable_api_termination = "true"
  vpc_security_group_ids  = [aws_security_group.allow_from_trust_to_firmbkap.id]
  subnet_id               = aws_subnet.LEGAAP1_A.id

  tags = {
    Name        = "sy-leg-firmbkap"
    Description = "펌뱅킹"
    Environment = "Prd"
    cz-product  = "Non-SAP"
    Schedule    = "samyang-office-hours"
    Snapshot    = "Yes"
    cz-ext1     = "sy-firmbkap"
  }
}