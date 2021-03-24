resource "local_file" "readme" {
    content  = output.aws_ec2_instance_types
    filename = "README.md"
}