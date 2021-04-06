resource "aws_vpc_dhcp_options" "dhcp_option_set" {
  domain_name          = var.dns
  domain_name_servers  = ["130.1.22.21", "130.1.22.30"]
  netbios_name_servers = ["130.1.22.21", "130.1.22.30"]

  tags = {
    Name = "${var.service_name}-dhcp-option-set"
  }
}

resource "aws_vpc_dhcp_options_association" "dhcp_vpc" {
  vpc_id          = aws_vpc.vpc.id
  dhcp_options_id = aws_vpc_dhcp_options.dhcp_option_set.id
}