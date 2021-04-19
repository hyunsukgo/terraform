
resource "aws_db_instance" "drawbkdb" {
  identifier = "drawbkdb"

  engine               = "oracle-se2"
  engine_version       = "18.0.0.0.ru-2021-01.rur-2021-01.r1"
  #family               = "oracle-se-18.0" # DB parameter group
  #major_engine_version = "12.1"           # DB option group
  instance_class       = "db.m5.2xlarge"
  license_model        = "license-included"

  allocated_storage     = 100
  max_allocated_storage = 2048
  storage_encrypted     = true

  # Make sure that database name is capitalized, otherwise RDS will try to recreate RDS instance every time
  name                   = "DRAWBKDB"
  username               = "drawbkdb"
  port                   = 1521
  password               = "!1samyang"
  multi_az               = false
  db_subnet_group_name   = aws_db_subnet_group.drawbkdb.name
  vpc_security_group_ids = [aws_security_group.allow_from_trust_to_drawbkdb.id]

  backup_retention_period = 0
  skip_final_snapshot     = true
  deletion_protection     = true 
  tags = {
    Snapshot    = "Yes"
  }
  performance_insights_enabled          = true
  performance_insights_retention_period = 7
}

resource "aws_db_subnet_group" "drawbkdb" {
  name       = "drawbkdb-db-subnets"
  subnet_ids = [aws_subnet.LEGARDS_A.id,aws_subnet.LEGARDS_C.id]

  tags = {
    Name = "drawbkdb DB subnet group"
  }
}