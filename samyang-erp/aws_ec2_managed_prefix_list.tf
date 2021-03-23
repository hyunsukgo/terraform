resource "aws_ec2_managed_prefix_list" "aempl" {
  name           = "${var.service_name} On-Prem CIDR-s"
  address_family = "IPv4"
  max_entries    = 5

  entry {
    cidr        = var.cidr
    description = "Primary"
  }
  entry {
    cidr        = "10.200.0.0/16"
    description = "Secondary"
  }

  tags = {
    Env = "live"
  }
}