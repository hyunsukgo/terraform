
data "aws_subnet_ids" "vpc" {
  vpc_id = aws_vpc.vpc.id
}

data "aws_subnet" "subnets" {
  for_each = data.aws_subnet_ids.vpc.ids
  id       = each.value
}

output "subnet_cidr_blocks" {
  #value = [for s in data.aws_subnet.subnets : s.cidr_block]
  value = "${formatlist("%s",(for s in data.aws_subnet.subnets : s.cidr_block)
  )}"
}