
data "aws_availability_zones" "available" {
  state = "available"
  filter {
    name   = "zone-name"
    values = ["ap-northeast-2a", "ap-northeast-2c"]
  }
}

resource "aws_subnet" "SAPDB1_A" {
  vpc_id = aws_vpc.vpc.id
  availability_zone = "ap-northeast-2a"
  cidr_block        = "10.200.10.0/26"

  tags  = {
    Name = "SAPDB1_A"
  }
}

resource "aws_subnet" "SAPAP1_A" {
  vpc_id = aws_vpc.vpc.id
  availability_zone = "ap-northeast-2a"
  cidr_block        = "10.200.20.0/26"

  tags  = {
    Name = "SAPAP1_A"
  }
}

resource "aws_subnet" "SAPDB2_C" {
  vpc_id = aws_vpc.vpc.id
  availability_zone = "ap-northeast-2c"
  cidr_block        = "10.200.11.0/26"

  tags  = {
    Name = "SAPDB2_C"
  }
}

resource "aws_subnet" "SAPAP2_C" {
  vpc_id = aws_vpc.vpc.id
  availability_zone = "ap-northeast-2c"
  cidr_block        = "10.200.21.0/26"

  tags  = {
    Name = "SAPAP2_C"
  }
}

resource "aws_subnet" "SAPDEV_A" {
  vpc_id = aws_vpc.vpc.id
  availability_zone = "ap-northeast-2a"
  cidr_block        = "10.200.30.0/26"

  tags  = {
    Name = "SAPDEV_A"
  }
}

resource "aws_subnet" "LEGADB1_A" {
  vpc_id = aws_vpc.vpc.id
  availability_zone = "ap-northeast-2a"
  cidr_block        = "10.200.40.0/25"

  tags  = {
    Name = "LEGADB1_A"
  }
}

resource "aws_subnet" "LEGAAP1_A" {
  vpc_id = aws_vpc.vpc.id
  availability_zone = "ap-northeast-2a"
  cidr_block        = "10.200.50.0/25"

  tags  = {
    Name = "LEGAAP1_A"
  }
}

resource "aws_subnet" "LEGADMZ_A" {
  vpc_id = aws_vpc.vpc.id
  availability_zone = "ap-northeast-2a"
  cidr_block        = "10.200.50.240/28"

  tags  = {
    Name = "LEGADMZ_A"
  }
}

resource "aws_subnet" "LEGADEV_A" {
  vpc_id = aws_vpc.vpc.id
  availability_zone = "ap-northeast-2a"
  cidr_block        = "10.200.60.0/26"

  tags  = {
    Name = "LEGADEV_A"
  }
}

resource "aws_subnet" "COMMON1_A" {
  vpc_id = aws_vpc.vpc.id
  availability_zone = "ap-northeast-2a"
  cidr_block        = "10.200.0.0/26"

  tags  = {
    Name = "COMMON1_A"
    RT   = "public"
  }
}
resource "aws_subnet" "COMMON2_C" {
  vpc_id = aws_vpc.vpc.id
  availability_zone = "${local.region}c"
  cidr_block        = "10.200.0.64/26"

  tags  = {
    Name = "COMMON1_A"
    RT   = "public"
  }
}
resource "aws_subnet" "NAS1_A" {
  vpc_id = aws_vpc.vpc.id
  availability_zone = "${local.region}a"
  cidr_block        = "10.200.0.128/27"

  tags  = {
    Name = "NAS1_A"
    RT   = "private"
  }
}
resource "aws_subnet" "NAS2_C" {
  vpc_id = aws_vpc.vpc.id
  availability_zone = "${local.region}c"
  cidr_block        = "10.200.11.160/27"

  tags  = {
    Name = "NAS2_C"
    RT   = "private"
  }
}
resource "aws_subnet" "INTERNAL1_A" {
  vpc_id = aws_vpc.vpc.id
  availability_zone = "${local.region}a"
  cidr_block        = "10.200.0.192/28"

  tags  = {
    Name = "INTERNAL1_A"
    RT   = "private"
  }
}
resource "aws_subnet" "INTERNAL2_C" {
  vpc_id = aws_vpc.vpc.id
  availability_zone = "${local.region}c"
  cidr_block        = "10.200.0.208/28"

  tags  = {
    Name = "INTERNAL2_C"
    RT   = "private"
  }
}

resource "aws_subnet" "SAPDB2_C" {
  vpc_id = aws_vpc.vpc.id
  availability_zone = "${local.region}c"
  cidr_block        = "10.200.11.0/26"

  tags  = {
    Name = "SAPDB2_C"
    RT   = "private"
  }
}
