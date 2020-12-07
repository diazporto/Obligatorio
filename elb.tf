## Balanceador de Carga


resource "aws_elb" "web_elb" {
  name = "asg-web"
  
  subnets  = [aws_subnet.main-1.id, aws_subnet.main-2.id]
  security_groups = [aws_security_group.allow_http.id]
  
  
  cross_zone_load_balancing   = true

  # # Configuraciones de verificación de estado HTTP

    health_check {
    target = "HTTP:80/index.php"
    healthy_threshold = 2
    unhealthy_threshold = 3
    interval = 30
    timeout = 5
  }

  tags = {
    Name = "ec2-elb"
  }
   

  listener {
    lb_port = 80
    lb_protocol = "http"
    instance_port = "80"
    instance_protocol = "http"
  }
     ## Instancias registradas en Load Balance 

  instances          = [aws_instance.webserver001.id, aws_instance.webserver002.id]
  
  idle_timeout                = 100
  connection_draining         = true
  connection_draining_timeout = 300
}

