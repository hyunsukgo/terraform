
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
/*
data "aws_instances" "ec2list" {
  instance_tags = {
    Name = "sy-eaccdev"
  }
  instance_state_names = ["running", "stopped"]
}*/
data "aws_instances" "ec2" {
  filter {
    name = "tag:Snapshot"
    values = ["Yes"]
  }
}

data "aws_instance" "ec2" {
  for_each = toset(data.aws_instances.ec2.ids)
  instance_id = each.key
}

output "aws_ec2_instance_types" {
  value = "${formatlist("%s | %s",data.aws_instances.ec2.ids[each.key],data.aws_instance.ec2.arn[each.key])}"
  #value = data.aws_instances.ec2.ids[*]
  #value = data.aws_instance.ec2[*].arn
}

