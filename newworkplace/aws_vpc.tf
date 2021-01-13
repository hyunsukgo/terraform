resource "aws_vpc" "vpc" {
  cidr_block       = "${local.cidr}"
  instance_tenancy = "default"
  
  tags = {
    Name = "${local.service_name}-vpc"
  }
}