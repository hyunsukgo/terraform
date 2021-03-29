
data "aws_subnet_ids" "vpc" {
  vpc_id = aws_vpc.vpc.id
}

data "aws_subnet" "subnets" {
  for_each = data.aws_subnet_ids.vpc.ids
  id       = each.value
}

output "subnet_cidr_blocks" {
  value = formatlist("| %s | %s | %s | %s |",[for s in data.aws_subnet.subnets : s.cidr_block],[for s in data.aws_subnet.subnets : s.availability_zone],[for s in data.aws_subnet.subnets : s.tags.Name],[for s in data.aws_subnet.subnets : s.vpc_id])
}

resource "local_file" "ec2_id" {
  content  = "${formatlist("| %s | %s | %s | %s |",[for s in data.aws_subnet.subnets : s.cidr_block],[for s in data.aws_subnet.subnets : s.availability_zone],[for s in data.aws_subnet.subnets : s.tags.Name],[for s in data.aws_subnet.subnets : s.vpc_id])}"
  filename = "ec2.md"
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
  value = formatlist("| %s | %s | %s | %s | %s |", [for name in data.aws_instance.ec2 : name.tags.Name], [for type in data.aws_instance.ec2 : type.instance_type], [for az in data.aws_instance.ec2 : az.availability_zone], [for s in data.aws_instance.ec2 : s.arn], [for a in data.aws_instance.ec2 : a.ami])
}
data "aws_ebs_volumes" "vol" {
  filter {
    name   = "tag:Name"
    values = ["sy-*"]
  }
}
data "aws_ebs_volume" "ebs_volume" {
  for_each = data.aws_ebs_volumes.vol.ids
  filter {
    name   = "volume-id"
    values = [each.value]
  }
}
output "aws_ec2_ebs_info" {
  value = formatlist("| %s | %s | %s |", [for id in data.aws_ebs_volume.ebs_volume : id.id],[for az in data.aws_ebs_volume.ebs_volume : az.availability_zone],[for name in data.aws_ebs_volume.ebs_volume : name.tags.Name])
}

data "aws_ebs_snapshot_ids" "ebs_volumes" {
  filter {
    name   = "tag:Name"
    values = [for name in data.aws_instance.ec2 : name.tags.Name]
  }
}

data "aws_ebs_snapshot" "ebs_volume" {
  #most_recent = true
  owners      = ["self"]
  filter {
    name   = "tag:Name"
    values = ["sy-*"]
  }
  for_each = toset(data.aws_ebs_snapshot_ids.ebs_volumes.ids)
  snapshot_ids = list(each.key)
}

output "aws_ebs_snapshot_info" {
  #value = data.aws_ebs_snapshot.ebs_volume[*]
  #value = formatlist("%s",[for name in data.aws_ebs_snapshot.ebs_volume : name.id])
  value = formatlist("| %s | %s | %s G | %s |",[for id in data.aws_ebs_snapshot.ebs_volume : id.id],[for vid in data.aws_ebs_snapshot.ebs_volume : vid.volume_id],[for size in data.aws_ebs_snapshot.ebs_volume : size.volume_size],[for name in data.aws_ebs_snapshot.ebs_volume : name.tags.Name])
}
