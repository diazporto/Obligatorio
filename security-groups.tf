## Security Group WEBSERVER

resource "aws_security_group" "allow_http" {
  name   = "allow_http"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Allow HTTP Security Group"
  }
}

## Security Group  RDS

resource "aws_security_group" "db" {
  name   = "DB_web"
  vpc_id = aws_vpc.main.id



# Ingress Security Port 3306
 ingress {
  from_port         = 3306
  protocol          = "tcp"
  to_port           = 3306
  cidr_blocks = [aws_vpc.main.cidr_block]
    }

## Permitir trafico saliente DB

egress {
  from_port         = 0
  protocol          = "-1"
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]

    }
}
