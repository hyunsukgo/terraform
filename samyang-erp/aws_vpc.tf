resource "aws_vpc" "vpc" {
    cidr_block       = local.cidr
    instance_tenancy = "default"
    enable_dns_hostnames = "true"
    tags = {
        Name = "${local.service_name}-vpc"
  }
}