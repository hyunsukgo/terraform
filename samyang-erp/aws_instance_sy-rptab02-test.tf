resource "aws_instance" "rptab02c" {
  ami           = "ami-0d587bc4ef1dd2699" # ap-northeast-2
  instance_type = "r5.2xlarge"

  private_ip           = "10.200.51.42"
  key_name             = "samyangerp"
  iam_instance_profile = "ssm"

  root_block_device {
    volume_type = "gp2"
    volume_size = 50
    tags = {
      Name      = "sy-rptap02"
      Partition = "rptap02_C"
      cz-ext1   = "sy-rptap02"
    }
  }
  disable_api_termination = "true"
  vpc_security_group_ids  = [aws_security_group.allow_from_trust_to_rptab.id]
  subnet_id               = aws_subnet.LEGAAP2_C.id

  tags = {
    Name        = "sy-rptap02"
    Description = "리포트서버"
    Environment = "Prd"
    cz-product  = "Non-SAP"
    Schedule    = "" #"samyang-office-hours-noholiday"
    Snapshot    = "Yes"
    cz-ext1     = "sy-rptap02"
  }
}
