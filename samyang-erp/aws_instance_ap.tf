
resource "aws_instance" "sapap" {
  ami           = "ami-097fc5cd098dd20d5"
  instance_type = "r5.2xlarge"
  private_ip = "10.200.30.12"
  security_groups = [aws_security_group.allow_ssh_from_vpn.id]
  root_block_device {
    volume_size = 30
    volume_type = "gp3"  
  }
  tags = {
    Name = "sapap1"
    Enviroment = "Dev"
  }
  key_name = "samyangerp"
  associate_public_ip_address = false
  #user_data = ${file("sapinst.sh")}
  subnet_id = aws_subnet.SAPDEV_A.id
}
resource "aws_volume_attachment" "sapmnt_att" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.sapmnt.id
  instance_id = aws_instance.sapap.id
}
resource "aws_volume_attachment" "usrsap_ap_att" {
  device_name = "/dev/sdc"
  volume_id   = aws_ebs_volume.usrsap-ap.id
  instance_id = aws_instance.sapap.id
}
resource "aws_volume_attachment" "usrsaptrans_att" {
  device_name = "/dev/sdd"
  volume_id   = aws_ebs_volume.usrsaptrans.id
  instance_id = aws_instance.sapap.id
}
/*
resource "aws_volume_attachment" "sapcd_ap_att" {
  device_name = "/dev/sde"
  volume_id   = aws_ebs_volume.sapcd-ap.id
  instance_id = aws_instance.sapap.id
}
*/
resource "aws_ebs_volume" "sapmnt" {
  availability_zone = "${local.region}a"
  size              = 10
  type              = "gp3"
}
resource "aws_ebs_volume" "usrsap-ap" {
  availability_zone = "${local.region}a"
  size              = 20
  type              = "gp3"
}
resource "aws_ebs_volume" "usrsaptrans" {
  availability_zone = "${local.region}a"
  size              = 100
  type              = "gp3"
}
/*
resource "aws_ebs_volume" "sapcd-ap" {
  availability_zone = "${local.region}a"
  size              = 2048
  type              = "gp3"
}
*/
