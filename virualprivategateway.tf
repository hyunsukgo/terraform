## SK 이노베이션 Virtual Private Gateway ##
resource "aws_vpn_gateway" "ski-vpg" {
  vpc_id = aws_vpc.ski-vpc.id

  tags = {
    Name = "ski-vpg"
  }
}
## SK E&S Virtual Private Gateway ##
resource "aws_vpn_gateway" "skens-vpg" {
  vpc_id = aws_vpc.skens-vpc.id

  tags = {
    Name = "skens-vpg"
  }
}
## SK 홀딩스 Virtual Private Gateway ##
resource "aws_vpn_gateway" "skhc-vpg" {
  vpc_id = aws_vpc.skhc-vpc.id

  tags = {
    Name = "skhc-vpg"
  }
}
## SUPEX Virtual Private Gateway ##
resource "aws_vpn_gateway" "supex-vpg" {
  vpc_id = aws_vpc.supex-vpc.id

  tags = {
    Name = "supex-vpg"
  }
}
## SK Data Lake Virtual Private Gateway ##
resource "aws_vpn_gateway" "datalake-vpg" {
  vpc_id = aws_vpc.datalake-vpc.id

  tags = {
    Name = "datalake-vpg"
  }
}