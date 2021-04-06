#!/bin/sh

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
    wget https://s3.ap-northeast-2.amazonaws.com/amazon-ssm-ap-northeast-2/latest/linux_amd64/amazon-ssm-agent.rpm
    sudo rpm --install amazon-ssm-agent.rpm
    sudo systemctl enable amazon-ssm-agent
    sudo systemctl start amazon-ssm-agent