resource "aws_vpc_peering_connection" "peering" {
  peer_owner_id = local.peerid
  peer_vpc_id   = local.peervpcid
  vpc_id        = aws_vpc.vpc.id
}