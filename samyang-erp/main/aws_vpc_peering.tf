resource "aws_vpc_peering_connection" "peering" {
  peer_owner_id = var.peerid
  peer_vpc_id   = var.peervpcid
  vpc_id        = aws_vpc.vpc.id
}