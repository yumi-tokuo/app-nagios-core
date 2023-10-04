# VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = "true"

  tags = {
    Name = "vpc"
  }
}

# INTERNET GATEWAY
resource "aws_internet_gateway" "igw_vpc" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "igw_vpc"
  }
}

# SUBNET
resource "aws_subnet" "sn_vpc" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.vpc_subnet_cidr_block
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "sn_vpc"
  }
}

# ROUTE TABLE
resource "aws_route_table" "rt_vpc" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_vpc.id
  }

  tags = {
    Name = "rt_vpc"
  }
}

# SUBNET ASSOCIATION
resource "aws_route_table_association" "rt_vpc_To_sn_vpc" {
  subnet_id      = aws_subnet.sn_vpc.id
  route_table_id = aws_route_table.rt_vpc.id
}

# SECURITY GROUP
resource "aws_security_group" "sg_vpc" {
  name        = "sg_vpc"
  description = "sg_vpc"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.vpc_cidr_block]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_vpc"
  }
}