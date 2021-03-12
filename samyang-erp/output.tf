data "aws_instances" "ec2list" {
}

output "id" {
  description = "List of IDs of instances"
  value       = data.aws_instances.ec2list.ids
}
