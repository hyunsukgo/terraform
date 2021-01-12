variable "vpc_id" {}
data "aws_vpc" "vpc" {
  id = "var.vpc-id".id
}
