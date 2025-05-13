# 🚀 Terraform AWS EC2 Multi-Instance Automation including NGINX Instalations 🚀

This repository contains Terraform configuration files to **automate the provisioning of multiple EC2 instances** on AWS, using best practices such as modular code structure, custom security groups, and user data for bootstrapping.

## 📌 Features

- Creates multiple EC2 instances using `count`
- Configurable AMI, instance type, and volume size via variables
- SSH, HTTP (port 80), and Flask (port 8000) access enabled via Security Group
- Custom key pair for secure access
- Bootstrap script to install and configure NGINX (`user_data`)
- Outputs EC2 public IP and DNS

## 📁 Project Structure

├── main.tf # Main resources: EC2, Security Group, Key Pair
├── variables.tf # Input variables
├── outputs.tf # Outputs like public IP/DNS
├── install_nginx.sh # User data script to install NGINX
├── terraform.tfvars # Variable values
├── .gitignore
└── README.md


## 🛠️ Usage

### 1. Clone the repository

```bash
git clone https://github.com/kishorpatil2107/AWS-TERRAFORM.git
cd AWS-TERRAFORM
2. Customize Variables (Optional)
Update values in terraform.tfvars to match your environment:
ec2_ami_id            = "ami-04f7a54071e74f488"
ec2_instance_type     = "t2.micro"
ec2_root_storage_size = 15
3. Initialize Terraform
terraform init
4. Validate and Plan
terraform validate
terraform plan
5. Apply the Configuration
terraform apply
🖥️ Output
The public IP and DNS of the created EC2 instances will be displayed in the output.

🌐 GitHub Repository
👉 View on GitHub

🙌 Credits
Created with guidance from #TrainWithShubham
Inspired by the growing #DevOps community!

📌 Tags
#Terraform #AWS #DevOps #InfrastructureAsCode #TrainWithShubham #Automation #EC2

