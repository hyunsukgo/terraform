
resource "aws_ec2_managed_prefix_list" "trusted" {
  name           = "${var.service_name} Trusted CIDR-s"
  address_family = "IPv4"
  max_entries    = 5
  
  entry {
    cidr        = "130.1.0.0/16"
    description = "On-Premise CIDR"
  }
  /*
  entry {
    cidr = var.cidr
    description = "VPC CIDR"
  }
  */
}