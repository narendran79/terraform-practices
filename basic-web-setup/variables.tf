variable "aws_region" {
  description = "You can chose prefred region"
  type        = string
  default     = "us-east-1a"
}

variable "aws_access_key" {
  description = "Get your access key from IAM"
  type        = string
  default     = "<your-access-key>"
}

variable "aws_secret_key" {
  description = "Get your secret key from IAM"
  type        = string
  default     = "<your-secret-key>"
}

variable "keypair" {
  description = "Get your keyname from ec2"
  type        = string
  default     = "<your-key-name>"
}

variable "ubuntu_ami" {
  description = "You can change the image as per your wish"
  type        = string
  default     = "ami-084568db4383264d4" #ubuntu image, you can change as your wish
}