
resource "aws_instance" "drawbkdb" {
  ami           = "ami-0133b1a5b9ca9be36" # ap-northeast-2
  instance_type = "m5.2xlarge"

  private_ip           = "10.200.40.71"
  key_name             = "samyangerp"
  iam_instance_profile = "ssm"

  root_block_device {
    volume_type = "gp2"
    volume_size = 100
    tags = {
      Name      = "sy-drawbkdb"
      Partition = "drawbkdb_root"
      cz-ext1   = "sy-drawbkdb"
    }
  }
  user_data = file("../scripts/wininst.sh")
  disable_api_termination = "true"
  security_groups = [aws_security_group.allow_from_trust_to_drawbkdb.id]
  subnet_id = aws_subnet.LEGADB1_A.id

  tags = {
    Name        = "sy-drawbkdb"
    Description = "관세환급 DB(Oracle)"
    Environment = "Prd"
    cz-product  = "Non-SAP"
    Schedule    = "samyang-office-hours"
    Snapshot    = "Yes"
    cz-ext1   = "sy-drawbkdb"
  }
}