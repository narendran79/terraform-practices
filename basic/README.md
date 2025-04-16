This Terraform configuration file (`main.tf`) is designed to create a basic AWS infrastructure that includes a Virtual Private Cloud (VPC), a subnet, an EC2 instance, and an S3 bucket with versioning enabled.

## Overview

The following resources are created by this Terraform configuration:

- **VPC**: A Virtual Private Cloud to host your resources.
- **Subnet**: A subnet within the VPC.
- **EC2 Instance**: A t2.micro instance running in the specified subnet.
- **S3 Bucket**: An S3 bucket with versioning enabled to store objects.

## Commands to be followed

After creating your main.tf file. You can use the following commands to get started

- **terraform init**: Run the following command to initialize the Terraform configuration
- **terraform plan**: Generate an execution plan to see what resources will be created
- **terraform apply**: Apply the configuration to create the resources
- **terraform destroy**: To clean up and remove all resources created by this configuration

## Screenshot

![image](https://github.com/user-attachments/assets/213f6e98-6c85-4d4b-bc5f-560d6cdb333f)

![image](https://github.com/user-attachments/assets/b3f438ae-c20d-4204-a0cc-a427974a0419)

![image](https://github.com/user-attachments/assets/2e050f40-4130-4dff-b85e-0bbc80db5537)

![image](https://github.com/user-attachments/assets/079d0554-5a4c-457a-9c17-184bac210c0f)
