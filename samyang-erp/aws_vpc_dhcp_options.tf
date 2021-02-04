resource "aws_vpc_dhcp_options" "dhcp_option_set" {
  domain_name          = "sy.com"
  domain_name_servers  = ["130.1.22.21", "130.1.22.30"]
  netbios_name_servers = ["130.1.22.21", "130.1.22.30"]

  tags = {
    Name = "${local.service_name}-dhcp-option-set"
  }
}