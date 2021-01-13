
resource "aws_redshift_subnet_group" "redshift_subnet_group" {
  name       = "foo"
  subnet_ids = [aws_subnet.redshift-subnet-a.id, aws_subnet.redshift-subnet-c.id]

  tags = {
    Name = "${local.service_name}-redshift-subnet-group"
    environment = "Production"
  }
}