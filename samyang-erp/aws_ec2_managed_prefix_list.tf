
resource "aws_ec2_managed_prefix_list" "trusted" {
  name           = "${var.service_name} Trusted CIDR-s"
  address_family = "IPv4"
  max_entries    = 5

  entry {
    cidr        = var.onprem
    description = "On-Premise CIDR"
  }

  entry {
    cidr        = aws_vpc.vpc.cidr_block
    description = "VPC CIDR"
  }

  entry {
    cidr        = var.peering-cidr
    description = "${var.service_name}WEB-peering"
  }

  entry {
    cidr        = "172.16.16.0/24"
    description = "On-Premise CIDR-DM2"
  }
}
