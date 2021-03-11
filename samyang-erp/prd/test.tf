resource "aws_instance" "rptab0222" {
  ami           = "ami-0fc1ba861e48fc890" # ap-northeast-2
  instance_type = "r5.2xlarge"

  private_ip = "10.200.50.41"
  key_name   = "samyangerp"
  iam_instance_profile =  "ssm"
  
  root_block_device {
    volume_type = "gp2"
    volume_size = 50
  }
  disable_api_termination = "true"
  #security_groups = [aws_security_group.allow_from_trust_to_rptab.id]
  subnet_id = aws_subnet.LEGAAP1_A.id

  tags = {
    Name        = "sy-rptab01"
    Description = "리포트서버"
    Environment = "Prd"
    cz-product  = "Non-SAP"
    Schedule    = "samyang-office-hours"
    Snapshot    = "Yes"
  }
}
