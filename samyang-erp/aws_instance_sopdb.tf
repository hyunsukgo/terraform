
resource "aws_instance" "sopdb" {
  ami                  = "ami-0bbac56d527e97165" # ap-northeast-2
  instance_type        = "r5.4xlarge"
  ebs_optimized        = true
  private_ip           = "10.200.40.11"
  key_name             = "samyangerp"
  iam_instance_profile = "ssm"

  root_block_device {
    volume_type = "gp3"
    iops        = 3000
    throughput  = 125
    volume_size = 40
    tags = {
      Name      = "sy-sopdb"
      Partition = "sopdb_C"
      cz-ext1   = "sy-sopdb"
    }
  }
  disable_api_termination = "true"
  vpc_security_group_ids  = [aws_security_group.allow_from_trust_to_sopdb.id]
  subnet_id               = aws_subnet.LEGADB1_A.id

  tags = {
    Name        = "sy-sopdb"
    Description = "S&OP(DB)"
    Environment = "Prd"
    cz-product  = "Non-SAP"
    Schedule    = "samyang-office-hours"
    Snapshot    = "Yes"
    cz-ext1     = "sy-sopdb"
  }
}
