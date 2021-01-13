resource "aws_redshift_cluster" "redshift_cluster" {
  cluster_identifier = "${local.service_name}-redshift-cluster"
  database_name      = "mydb"
  master_username    = "foo"
  master_password    = "Mustbe8characters"
  node_type          = "dc1.large"
  cluster_type       = "single-node"
}
