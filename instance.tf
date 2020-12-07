# # Instancia 1 de EC2



resource "aws_instance" "webserver001" {
  ami           =  var.ami
  instance_type =  var.instance_type
  key_name =  var.key_name
  security_groups = [aws_security_group.allow_http.id]
  subnet_id       = aws_subnet.main-1.id
  
  user_data = file("/home/marcos/terraform/Obligatorio/webserver.sh")
  tags = {
    Name = "webserver001"
  } 
  connection {
    type = "ssh"
    user = "centos"
    private_key = file("/home/marcos/terraform/Obligatorio/ubuntu.pem")
    host = self.public_ip
    }
    
}

# # Instancia 2 de EC2
resource "aws_instance" "webserver002" {
  ami           =  var.ami
  instance_type =  var.instance_type
  key_name =  var.key_name
  security_groups = [aws_security_group.allow_http.id]
  subnet_id       = aws_subnet.main-2.id
  
  user_data = file("/home/marcos/terraform/Obligatorio/webserver.sh")
  tags = {
    Name = "webserver002"
  } 
  connection {
    type = "ssh"
    user = "centos"
    private_key = file("/home/marcos/terraform/Obligatorio/ubuntu.pem")
    host = self.public_ip
    }
    
}