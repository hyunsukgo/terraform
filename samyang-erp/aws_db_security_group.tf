resource "aws_db_security_group" "drawbkdb_sg" {
  name = "rds_sg"

  ingress {
    cidr = "10.0.0.0/24"
  }
}