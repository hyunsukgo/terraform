resource "aws_vpc_peering_connection" "foo" {
  peer_vpc_id   = "vpc-087b7f1a782a8a6f5"
  vpc_id        = aws_vpc.samyang_vpc.id
  auto_accept   = true
  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }
}