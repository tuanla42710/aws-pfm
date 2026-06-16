provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_security_group" "mysql_sg" {
  name        = "mysql_security_group"
  description = "Allow inbound traffic to MySQL"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mysql-security-group"
  }
}


resource "aws_db_subnet_group" "mysql_subnet_group" {
  name       = "mysql_subnet_group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "My SQL DB subnet group"
  }
}


resource "aws_db_instance" "mysql_db" {
  identifier           = "mysql-db"
  engine               = "mysql"
  engine_version       = "8.0.45"
 
  instance_class       = "db.t3.micro"       
  allocated_storage    = 20                  
  storage_type         = "gp2"               
  multi_az             = false               
  
  # Database Credentials
  db_name              = "pfm"
  username             = "pfm_user"
  password             = "pfm_user"
  

  publicly_accessible  = false
  skip_final_snapshot  = true 

  db_subnet_group_name   = aws_db_subnet_group.mysql_subnet_group.name
  vpc_security_group_ids = [aws_security_group.mysql_sg.id]
  
}


output "rds_endpoint" {
  description = "The connection endpoint for the MySQL database"
  value       = aws_db_instance.mysql_db.endpoint
}
