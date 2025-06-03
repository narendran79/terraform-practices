# AWS Infrastructure with Terraform

This project automates the deployment of a basic AWS environment using Terraform. It provisions a VPC, subnets, security groups, and an EC2 instance running a simple Apache web server with a "index.html" page — all without needing SSH access.

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

## Snapshot
- Created a instance and configured terraform in that server. After that I've ran the terraform script.
   <img width="431" alt="terraform-apply" src="https://github.com/user-attachments/assets/ed218e4a-8e5f-41fe-8ddd-2b11b05b5c59" />

---

- After using terraform plan, terraform validate and terraform apply command. We can see the vpc and ec2 instance created in the aws account.
  <img width="932" alt="vpc" src="https://github.com/user-attachments/assets/2e8d9ac2-b976-4504-b885-3bbc5ab5d919" />

---
  <img width="778" alt="sg" src="https://github.com/user-attachments/assets/affb27dc-1ee8-424e-9d2b-2d96a1b91cbb" />

---
  <img width="782" alt="ec2" src="https://github.com/user-attachments/assets/793801e8-a62c-48ee-bc1c-fa87f5d1e85f" />

---
- Output of the index page running in the instance
  <img width="284" alt="output" src="https://github.com/user-attachments/assets/b1b0446e-1eec-4b2e-b975-c0227d36cbdb" />



