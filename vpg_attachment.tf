## SK 이노베이션 VPC Attachment ##
resource "aws_vpn_gateway_attachment" "ski-vpg_attachment" {
  vpc_id         = aws_vpc.ski-vpc.id
  vpn_gateway_id = aws_vpn_gateway.ski-vpg.id
}
## SK 이노베이션 VPC Attachment ##
resource "aws_vpn_gateway_attachment" "skens-vpg_attachment" {
  vpc_id         = aws_vpc.skens-vpc.id
  vpn_gateway_id = aws_vpn_gateway.ski-vpg.id
}
## SK 이노베이션 VPC Attachment ##
resource "aws_vpn_gateway_attachment" "skhc-vpg_attachment" {
  vpc_id         = aws_vpc.skhc-vpc.id
  vpn_gateway_id = aws_vpn_gateway.skhc-vpg.id
}
## SK 이노베이션 VPC Attachment ##
resource "aws_vpn_gateway_attachment" "supex-vpg_attachment" {
  vpc_id         = aws_vpc.supex-vpc.id
  vpn_gateway_id = aws_vpn_gateway.supex-vpg.id
}
## SK 이노베이션 VPC Attachment ##
resource "aws_vpn_gateway_attachment" "datalake-vpg_attachment" {
  vpc_id         = aws_vpc.datalake-vpc.id
  vpn_gateway_id = aws_vpn_gateway.datalake-vpg.id
}