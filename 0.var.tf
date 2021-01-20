#variable.tf :변수생성

variable "amazon_linux" {
# Amazon Linux AMI 2018.03.0 (HVM), SSD Volume Type  리젼에서 호출할 기본AMI 정보 입력
     default = "ami-9bec36f5" 
    # 리눅스2
     # default ="ami-064c81ce3a290fde1", 1세대로 구축
     # 파일에있는것
     #default = "ami-9bec36f5"
}


variable "dev_keyname" {
# EC2 접속시 필요한 키 이름 설정
    default = "user100-key"
}

# ALB 설정시 필요한 account id 설정
variable "alb_account_id_ca" {
    default = "600734575887"
}