## SK 이노베이션 Customer Gateway ##
resource "aws_customer_gateway" "ski-cgw" {
  bgp_asn    = 65000
  ip_address = "168.154.122.206"
  type       = "ipsec.1"

  tags = {
    Name = "ski-cgw"
  }
}
## SK E&S Customer Gateway ##
resource "aws_customer_gateway" "skens-cgw" {
  bgp_asn    = 65000
  ip_address = "168.154.182.140"
  type       = "ipsec.1"

  tags = {
    Name = "skens-cgw"
  }
}
## SK 홀딩스 & Supex Customer Gateway ##
resource "aws_customer_gateway" "skhc-supex-cgw" {
  bgp_asn    = 65000
  ip_address = "61.97.15.132"
  type       = "ipsec.1"

  tags = {
    Name = "skhc-supex-cgw"
  }
}
