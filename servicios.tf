#Base de datos

// The two subnets from above
resource "aws_db_subnet_group" "db" {
  subnet_ids = [aws_subnet.main-1.id, aws_subnet.main-2.id]
}


resource "aws_db_instance" "db" {
  
  allocated_storage     = 20
  max_allocated_storage = 30
  storage_type          = "gp2"
  engine                = "mysql"
  engine_version        = "5.6.34"
  instance_class        = "db.t2.micro"
  name                  = "DB_web"
  username              = "admin"
  password              = "Password01"
  multi_az			    = "true"
  vpc_security_group_ids = [aws_security_group.db.id]
  db_subnet_group_name = aws_db_subnet_group.db.id
  tags = {
    Name = "DB_Oblig"
  } 
}
// output the database endpoint URL
output "database_endpoint" {
  value = aws_db_instance.db.endpoint
}


#Bucket
resource "aws_s3_bucket" "bucket-web-backup" {
  bucket = "bucket-web-backup"
    acl    = "private"
    
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
 }  
    versioning {   #Versionado de los archivos activado
    enabled = true
  }
  tags = {
    Name        = "bucket-web-backup"
    Environment = "Free tier"
  }
}