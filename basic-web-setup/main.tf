# This Terraform file provisions a VPC and the necessary security configurations. 
# It then creates an EC2 instance within the configured subnet and security group, 
# and deploys a basic HTML page on the instance.
# This is suitable for free-tier account.
provider "aws" {
  region = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# -------------------------
#       VPC Creation
# -------------------------
# Creates a VPC with a /16 CIDR block.

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "basic-vpc-using-terraform"
  }
}

# Public Subnet (used to launch instances that need direct internet access)
resource "aws_subnet" "public" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.0.0/20"
  availability_zone = var.aws_region
  tags = {
    Name = "public-subnet-using-terraform"
  }
}

#If you want to access Private Subnet, then create a NAT Gateway
resource "aws_subnet" "private" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.16.0/20"
  availability_zone = var.aws_region
  tags = {
    Name = "private-subnet-using-terraform"
  }
}

# Internet Gateway to allow traffic from the internet to public resources
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "Main-gateway"
  }
}

# Route table to define public routes
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "table_association" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# Allows SSH (port 22) and HTTP (port 80) from anywhere
resource "aws_security_group" "vpc_securityGroup" {
  name = "security_group_using_terraform"
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  # Allow all outbound traffic
  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# -------------------------
#       EC2 Instance
# -------------------------
# Launches a t2.micro instance in the public subnet with Apache installed

resource "aws_instance" "my_instance" {
  ami = var.ubuntu_ami
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public.id
  key_name = var.keypair
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.vpc_securityGroup.id]
  
  # User data script to install Apache and deploy a basic HTML page
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y apache2
              sudo systemctl start apache2
              sudo systemctl enable apache2
              echo "<h1>Hello World using ec2 instance using terraform script</h1>" > /var/www/html/index.html
            EOF
  tags = {
    Name = "ec2-using-terraform"
  }
}
