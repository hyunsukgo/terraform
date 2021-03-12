resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = "true"
  tags = {
    Name = "${var.service_name}-vpc"
  }
}