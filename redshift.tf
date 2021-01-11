module "redshift" {
  source  = "terraform-aws-modules/redshift/aws"
  version = "~> 2.0"

  cluster_identifier      = "ski-redshift"
  cluster_node_type       = "dc1.large"
  cluster_number_of_nodes = 1

  cluster_database_name   = "mydb"
  cluster_master_username = "mydbuser"
  cluster_master_password = "mySecretPassw0rd"

  # Group parameters
  wlm_json_configuration = "[{\"query_concurrency\": 5}]"

  # DB Subnet Group Inputs
  subnets = [aws_redshift_subnet_group.ski-redshift-subnet-group.id]

  # IAM Roles
  cluster_iam_roles = ["arn:aws:iam::225367859851:role/glue_service_role"]
}
resource "aws_redshift_subnet_group" "ski-redshift-subnet-group" {
  name       = "foo"
  subnet_ids = [aws_subnet.ski-redshift-subnet-a.id, aws_subnet.ski-redshift-subnet-c.id]

  tags = {
    environment = "Production"
    name = "ski-redshift-subnet-group"
  }
}