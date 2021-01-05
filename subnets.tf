resource "aws_subnet" "ski-glue-subnet" {
  vpc_id     = aws_vpc.ski-vpc.id
  cidr_block = "10.0.100.0/24

  tags = {
    Name = "ski-glue-subnet"
  }
}