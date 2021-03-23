resource "aws_ec2_managed_prefix_list" "aempl" {
  name           = "${var.service_name} On-Prem CIDR-s"
  address_family = "IPv4"
  max_entries    = 5

  entry {
    cidr        = "10.200.0.0/16"
    description = "VPC CIDR"
  }
  entry {
    cidr        = var.cidr
    description = "On-Prem"
  }

  tags = {
    Env = "live"
  }
}