
resource "aws_instance" "firmbkap" {
  ami           = "ami-0133b1a5b9ca9be36" # ap-northeast-2
  instance_type = "m5.large"

  private_ip           = "10.200.50.242"
  key_name             = "samyangerp"
  iam_instance_profile = "ssm"

  root_block_device {
    volume_type = "gp2"
    volume_size = 100
    tags = {
      Name      = "sy-firmbkap"
      Partition = "firmbkap_root"
      cz-ext1   = "sy-firmbkap"
    }
  }
  user_data = file("../scripts/wininst.sh")
  disable_api_termination = "true"
  security_groups = [aws_security_group.allow_from_trust_to_firmbkap.id]
  subnet_id = aws_subnet.LEGADMZ_A.id

  tags = {
    Name        = "sy-firmbkap"
    Description = "펌뱅킹"
    Environment = "Prd"
    cz-product  = "Non-SAP"
    Schedule    = "samyang-office-hours"
    Snapshot    = "Yes"
    cz-ext1   = "sy-firmbkap"
  }
}