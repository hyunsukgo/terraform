#!/bin/sh
    
    # 타임존 설정
    timedatectl set-timezone Asia/Seoul

    # 패키지 설치 마지막
    yum -y update  # Zypper 업데이트
     
    # Amazon SSM Agent Installation
    wget https://s3.ap-northeast-2.amazonaws.com/amazon-ssm-ap-northeast-2/latest/linux_amd64/amazon-ssm-agent.rpm
    sudo rpm --install amazon-ssm-agent.rpm
    sudo systemctl enable amazon-ssm-agent
    sudo systemctl start amazon-ssm-agent