resource "aws_launch_configuration" "sedap" {

  image_id = "ami-097fc5cd098dd20d5"
  instance_type = "m5.2xlarge"
  key_name = "test"
  vpc_id = aws_vpc.vpc.id
  security_groups = "${aws_default_security_group.sy_d_sg.id}"
  subnet_id = "${aws_subnet.SAPAP1_A.id}"
  /*위에서 생성한 PEM키를 어떻게 변환해야 되는지 확인 중*/
  #private_ips = ["10.200.30.12"] # aws_instance 리소스에 적용 가능
  associate_public_ip_address = false
  user_data = "${file("sapinst.sh")}"

  lifecycle {
    create_before_destroy = true
  }
}