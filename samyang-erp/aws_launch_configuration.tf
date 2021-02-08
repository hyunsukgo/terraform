resource "aws_launch_configuration" "sedap" {

  image_id = "ami-097fc5cd098dd20d5"
  instance_type = "m5.2xlarge"
  key_name = ""
  vpc_id = aws_vpc.vpc.id
  security_groups = "${aws_default_security_group.sy_d_sg.id}"
  subnet_id = "${aws_subnet.SAPAP1_A.id}"
  /*위에서 생성한 PEM키를 어떻게 변환해야 되는지 확인 중*/
  private_ips = ["10.200.30.12"]
  associate_public_ip_address = false
    
  user_data = <<USER_DATA
#!/bin/sh
# Hostname Configuration
HOSTNAME=sedap
# DomainName Configuration
DOMAINNAME=samyang.com
# PATH TO YOUR HOSTS FILE
ETC_HOSTS=/etc/hosts

# DEFAULT IP FOR HOSTNAME
IP=$(ec2metadata --local-ipv4)
# 호스트네임 설정
hostnamectl set-hostname ${HOSTNAME}
echo "${IP}     ${HOSTNAME}.${DOMAINNAME} ${HOSTNAME}" >> /etc/hosts
# Timezone Configuration
# 타임존 설정
timedatectl set-timezone Asia/Seoul
# Groupt Add
groupadd -g 1001 sapsys
groupadd -g 1002 dba
groupadd -g 1003 sapinst

# User Add
useradd -g 1001 -u 1001 sedadm
useradd -g 1002 -u 1002 sapadm
useradd -g 1003 -u 1003 daaadm

# 파티션 설정

# 패키지 설치 마지막
zypper -y update  # Zypper 업데이트
zypper install -y sapconf libatomic1 insserv libltdl7 x11-tools libgthread-2_0-0 net-tools-deprecated

# System Kernel Parameter Modification
sysctl -w vm.max_map_count=2147483647 #커널 파라미터 수정

# Amazon SSM Agent Installation
wget https://s3.region.amazonaws.com/amazon-ssm-region/latest/linux_amd64/amazon-ssm-agent.rpm
sudo rpm --install amazon-ssm-agent.rpm
sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent
  USER_DATA

  lifecycle {
    create_before_destroy = true
  }
}