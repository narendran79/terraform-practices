# AWS Infrastructure with Terraform

This project automates the deployment of a basic AWS environment using Terraform. It provisions a VPC, subnets, security groups, and an EC2 instance running a simple Apache web server with a "Hello World" page — all without needing SSH access.

---

## What’s Included

- Custom VPC with public and private subnets  
- Internet Gateway and routing  
- Security Group allowing SSH and HTTP  
- t2.micro EC2 instance (Free Tier eligible)  
- Apache installed via user data script  

---

## Prerequisites

- Terraform installed  
- AWS account with Access Key and Secret Key  
- Existing AWS Key Pair in your region  

---

## Usage

1. Clone this repo  
2. Update variables as needed (e.g., region, AMI, key pair)  
3. Run `terraform init`  
4. Run `terraform apply`  
5. Access the EC2 public IP to see the web page  

---

## Cleanup

Run `terraform destroy` to remove all resources.

---

## Notes

- Designed for AWS Free Tier  
- No manual SSH required; Apache configured automatically  
- Remember to destroy resources to avoid charges  

---

## Inspired by curiosity — deploying fully automated cloud infrastructure with Terraform!

---

Feel free to connect or ask for the GitHub repo link!
