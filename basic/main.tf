provider "aws" {
  region = "us-east-1"
}

# This main.tf contains of basic creation of vpc, subnet, ec2 instance and s3 bucket with versioning enabled....

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-bucket-using-terraform-dev"
  tags = {
    Name = "my-s3-bucket"
  }
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "172.31.0.0/16"
  tags = {
    Name = "basic-vpc-using-terraform"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "172.31.32.0/20"
  availability_zone = "us-east-1a"
  tags = {
    Name = "subnet-using-terraform"
  }
}

resource "aws_instance" "example" {
  ami = "ami-084568db4383264d4"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.my_subnet.id
  key_name = "demo_terraform"
  tags = {
    Name = "ec2-using-terraform"
  }
}

resource "aws_s3_bucket_versioning" "versioning_bucket" {
  bucket = aws_s3_bucket.my_bucket.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_object" "bucket_object" {
  bucket = aws_s3_bucket.my_bucket.bucket
  key = "sample.txt"
  source = "to_your_path/sample.txt"
  etag = filemd5("to_your_path/sample.txt")
}