# # aws_launch_configuration 

resource "aws_launch_configuration" "web" {
  name_prefix = "webserver-"

  image_id = var.ami 
  instance_type = var.instance_type
  key_name = var.key_name

  security_groups = [aws_security_group.allow_http.id]
  associate_public_ip_address = true

  user_data = file("/home/marcos/terraform/Obligatorio/webserver.sh")

  lifecycle {
    create_before_destroy = true
  }
}

