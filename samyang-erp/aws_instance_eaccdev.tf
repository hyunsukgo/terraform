resource "aws_instance" "eaccap01" {
  ami           = "ami-0fc1ba861e48fc890" # ap-northeast-2
  instance_type = "m5.2xlarge"

  private_ip = "10.200.50.31"
  key_name  = "samyang-erp"

  volume_type = gp3
  volume_size = 10G

  security_groups = aws_security_group.allow_from_trust_to_eacc.id
  subnet_id = aws_subnet.LEGAAP1_A.id

  tags = {
      Name = "sy-eaccap01(HAAP4)"
      Description = "전자전표(AP)"
      Environment = "Dev"
      cz-product = "Non-SAP"
  }
}