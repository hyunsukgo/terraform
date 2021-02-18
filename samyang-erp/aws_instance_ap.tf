
resource "aws_ebs_volume" "sapmnt" {
  availability_zone = "${local.region}a"
  size              = 10
  type              = "gp3"
  tags = {
    Snapshot = "true"
  }
}
resource "aws_ebs_volume" "usrsap-ap" {
  availability_zone = "${local.region}a"
  size              = 20
  type              = "gp3"
  tags = {
    Snapshot = "true"
  }
}
resource "aws_ebs_volume" "usrsaptrans" {
  availability_zone = "${local.region}a"
  size              = 100
  type              = "gp3"
  tags = {
    Snapshot = "true"
  }
}

resource "aws_ebs_volume" "sapcd-ap" {
  availability_zone = "${local.region}a"
  size              = 300
  type              = "gp3"
  tags = {
    Snapshot = "true"
  }
}
resource "aws_ebs_volume" "endb" {
  availability_zone = "${local.region}a"
  size              = 10
  type              = "gp2"
  tags = {
    Name     = "${local.service_name}-endb"
    Snapshot = "true"
  }
}