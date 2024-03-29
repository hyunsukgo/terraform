
resource "aws_instance" "sapdb" {
  ami           = "ami-097fc5cd098dd20d5"
  instance_type = "r5.8xlarge"
  private_ip = "10.200.30.11"
  #security_groups = [aws_security_group.allow_ssh_from_vpn.id]
  root_block_device {
    volume_size = 30
    volume_type = "gp3"  
  }
  tags = {
    Name = "sapdb1"
    Enviroment = "Dev"
  }
  key_name = "samyangerp"
  associate_public_ip_address = false
  user_data = "${file("./scripts/sapinst.sh")}"
  subnet_id = aws_subnet.SAPDEV_A.id
}
