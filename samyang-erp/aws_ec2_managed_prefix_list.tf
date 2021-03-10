resource "aws_ec2_managed_prefix_list" "aempl" {
  name           = "${local.service_name} On-Prem CIDR-s"
  address_family = "IPv4"
  max_entries    = 5

  entry {
    cidr        = "130.1.0.0/16"
    description = "Primary"
  }

  tags = {
    Env = "live"
  }
}