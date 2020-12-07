# Default Region

variable "region" {
  description = "AWS Region"
  default = "us-east-1"
}
variable "profile" {
  default = "default"
}
variable "instance_type" {
  description = "EC2  instance type"
  default     = "t2.small"
}

variable "ami" {
  description = "AMI"
  default     = "ami-0055d58addfe009d0"
}
variable "key_name" {
  description = "Nombre de Key"
  default     = "ubuntu"
}



output "dns-publico" {
  value = [aws_instance.webserver001.public_dns, aws_instance.webserver002.public_dns]
}