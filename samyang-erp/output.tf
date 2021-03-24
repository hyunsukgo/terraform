
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

data "aws_instances" "ec2" {
  filter {
    name   = "tag:Name"
    values = ["sy-*"]
  }
}

data "aws_instance" "ec2" {
  for_each    = toset(data.aws_instances.ec2.ids)
  instance_id = each.key
}

output "aws_ec2_instance_info" {
  value = formatlist("%s | %s | %s | %s | %s", [for name in data.aws_instance.ec2 : name.tags.Name], [for type in data.aws_instance.ec2 : type.instance_type], [for az in data.aws_instance.ec2 : az.availability_zone], [for s in data.aws_instance.ec2 : s.arn], [for a in data.aws_instance.ec2 : a.ami])
}
/*
output "aws_ec2_ebs_info" {
  value = formatlist("%s | %s | %s", [for name in data.aws_instance.ec2 : name.ebs_block_device.device_name[*]], [for type in data.aws_instance.ec2 : type.ebs_block_device.volume_type[*]], [for size in data.aws_instance.ec2 : size.ebs_block_device.volume_size[*]])
}
*/
data "aws_ebs_snapshot_ids" "ebs_volumes" {
  filter {
    name   = "tag:Name"
    values = data.aws_instance.ec2.tags.Name[*]
  }
}
data "aws_ebs_snapshot" "ebs_volume" {
  most_recent = true
  snapshot_ids    = tolist(data.aws_ebs_snapshot_ids.ebs_volumes.ids)
}


output "aws_ebs_snapshot_info" {
  #value = formatlist("%s",[for name in data.aws_ebs_snapshot.ebs_volume : name.id])
  value = formatlist("%s",data.aws_ebs_snapshot.ebs_volume.arn[*])
}