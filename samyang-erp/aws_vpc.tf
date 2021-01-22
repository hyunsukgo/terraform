resource "aws_vpc" "samyang_vpc" {
    cidr_block       = "${substr("${local.cidr}"
    instance_tenancy = "default"
    enable_dns_hostnames = "true"
    tags = {
        Name = "samyang-vpc"
  }
}