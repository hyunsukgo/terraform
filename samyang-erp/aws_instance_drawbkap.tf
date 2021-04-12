
resource "aws_instance" "drawbkap" {
  ami           = "ami-0133b1a5b9ca9be36" # ap-northeast-2
  instance_type = "c5.2xlarge"

  private_ip           = "10.200.50.243"
  key_name             = "samyangerp"
  iam_instance_profile = "ssm"

  root_block_device {
    volume_type = "gp2"
    volume_size = 100
    tags = {
      Name      = "sy-drawbkap"
      Partition = "drawbkap_root"
      cz-ext1   = "sy-drawbkap"
    }
  }
  user_data = file("./scripts/wininst.sh")
  disable_api_termination = "true"
  security_groups = [aws_security_group.allow_from_trust_to_drawbkap2.id]
  subnet_id = aws_subnet.LEGADMZ_A.id

  tags = {
    Name        = "sy-drawbkap"
    Description = "관세환급 AP"
    Environment = "Prd"
    cz-product  = "Non-SAP"
    Schedule    = "samyang-office-hours"
    Snapshot    = "Yes"
    cz-ext1   = "sy-drawbkap"
  }
}