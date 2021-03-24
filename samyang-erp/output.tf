
data "aws_subnet_ids" "vpc" {
  vpc_id = aws_vpc.vpc.id
}

data "aws_subnet" "subnets" {
  for_each = data.aws_subnet_ids.vpc.ids
  id       = each.value
}

output "subnet_cidr_blocks" {
  value = [for s in data.aws_subnet.subnets : s.cidr_block]
}
data "aws_instances" "ec2list" {
  instance_tags = {
    Name = "sy-eaccdev"
  }
output "aws_ec2_instance_types" {
  value = [for i in data.aws_instances.ec2list : i.arn]
}

