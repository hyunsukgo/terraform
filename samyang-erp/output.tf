data "aws_instances" "ec2list" {
}

output "id" {
  description = "List of IDs of instances"
  count       = length(data.aws_instances.ec2list.ids)
  value       = data.aws_instances.ec2list.ids[count.index]
}
