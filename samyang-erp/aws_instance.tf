/*
resource "aws_instance" "sapap" {
  ami           = "ami-097fc5cd098dd20d5"
  instance_type = "m5.2xlarge"
  private_ip = "10.200.30.12"
  tags = {
    Name = "sapap1"
    Enviroment = "Dev"
  }
  key_name = "samyangerp"
  associate_public_ip_address = false
  #user_data = ${file("sapinst.sh")}
  subnet_id = aws_subnet.SAPDEV_A.id
}/*
resource "aws_instance" "sapdb" {
  ami           = "ami-097fc5cd098dd20d5"
  instance_type = "m5.8xlarge"
  private_ip = "10.200.30.11"
  tags = {
    Name = "sapdb1"
    Enviroment = "Dev"
  }
  key_name = "samyangerp"
  associate_public_ip_address = false
  #user_data = "${file("sapinst.sh")}"
  subnet_id = aws_subnet.SAPDEV_A.id
}
*/