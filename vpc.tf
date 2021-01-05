resource "aws_vpc" "ski-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"

  tags = {
    Name = "ski-vpc"
  }
}
resource "aws_vpc" "skens-vpc" {
  cidr_block       = "10.1.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"

  tags = {
    Name = "skens-vpc"
  }
}
resource "aws_vpc" "skhc-vpc" {
  cidr_block       = "10.2.0.0/24"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"

  tags = {
    Name = "skhc-vpc"
  }
}
resource "aws_vpc" "supex-vpc" {
  cidr_block       = "10.3.0.0/24"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"

  tags = {
    Name = "supex-vpc"
  }
}
resource "aws_vpc" "datalake-vpc" {
  cidr_block       = "10.30.0.0/24"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"

  tags = {
    Name = "datalake-vpc"
  }
}