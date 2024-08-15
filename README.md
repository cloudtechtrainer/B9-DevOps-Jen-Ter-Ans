# B9-DevOps-Jen-Ter-Ans

# Infrastructure Automation with Terraform, Ansible, and Jenkins

This project demonstrates how to automate the provisioning of AWS infrastructure using Terraform, configure the provisioned instances with Ansible, and orchestrate the entire process using a Jenkins pipeline.

## Prerequisites

Before you can run this project, ensure you have the following:

1. **EC2 Instance Requirements**
   - Use an EC2 instance type bigger than `t3.micro` to avoid performance issues during execution.
   - An IAM role should be attached to the instance with proper permissions to access AWS resources (e.g., EC2, S3).

2. **Software and Tools**
   - **Terraform**: Ensure Terraform is installed on the EC2 instance.
   - **Ansible**: Ansible must be installed on the EC2 instance.
   - **Jenkins**: Jenkins must be installed and running on the EC2 instance.
   - **Jenkins Plugins**: Install the following plugins in Jenkins:
     - Terraform
     - Ansible
     - Pipeline
     - AWS

3. **AWS Configuration**
   - Run `aws configure` on the EC2 instance to set up AWS credentials.
   - Set up AWS credentials inside Jenkins by navigating to `Manage Jenkins` > `Manage Credentials` and adding the necessary AWS credentials.

4. **GitHub Configuration**
   - Set up credentials for GitHub in Jenkins to allow Jenkins to pull code from your GitHub repository.

5. **Manual Steps**
   - Manually move the SSH key into the Ansible folder from your local machine to ensure Ansible can SSH into the provisioned instances.

## Project Structure

- `Terraform/`: Terraform script to provision AWS infrastructure.
- `Ansible/`: Ansible playbooks to configure the provisioned instances.
- `Jenkinsfile`: Script to define the Jenkins pipeline.

## Getting Started

1. Clone this repository to your EC2 instance.
2. Ensure all the prerequisites are met.
3. Run the Jenkins pipeline to start the provisioning and configuration process.
