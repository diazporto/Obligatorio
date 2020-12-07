
resource "aws_vpc" "main" {
  cidr_block = "172.16.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "Main_VPC"
  }
}

// first subnet
resource "aws_subnet" "main-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "172.16.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "Public Subnet us-east-1a"
  }
}

// second subnet
resource "aws_subnet" "main-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "172.16.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "Public Subnet us-east-1b"
  }
}

// adding internet gateway to the vpc
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "Internet Gateway"
  }
}



// adding the route table entry 
// to use the internet gateway 
resource "aws_default_route_table" "main" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  default_route_table_id = aws_vpc.main.default_route_table_id
}