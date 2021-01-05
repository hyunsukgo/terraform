resource "aws_vpc" "skhc-vpc" {
  cidr_block       = "10.0.0.0/24"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"

  tags = {
    Name = "skhc-vpc"
  }
}
