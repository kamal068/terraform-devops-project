resource "aws_db_instance" "default" {
  identifier              = "${var.project_name}-db"
  allocated_storage       = 20
  storage_type            = "gp3"
  engine                  = "postgres"
  engine_version          = "15.4"
  instance_class          = "db.t3.micro"
  username                = "adminuser"
  password                = var.db_password
  publicly_accessible     = false
  skip_final_snapshot     = true

  vpc_security_group_ids  = ["your-db-security-group"]
  db_subnet_group_name    = "your-subnet-group"
  
  tags = {
    Name        = "${var.project_name}-rds"
    Environment = "Dev"
  }
}