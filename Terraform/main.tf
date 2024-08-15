# main.tf

terraform {
  required_version = ">= 1.3.0"
}

provider "aws" {
  region  = "ap-south-2"
}

# Create a new security group that allows incoming SSH traffic
resource "aws_security_group" "ssh" {
  name_prefix = "allow-ssh-and-http"
  
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
  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create a new EC2 instance and associate it with the security group
resource "aws_instance" "example" {
  count = 2
  ami           = "ami-0c548ac9d29f2213d"
  instance_type = "t3.micro"
  key_name = "remote-key"
  vpc_security_group_ids = [aws_security_group.ssh.id]
}

# Output the public IPs of the instances
output "instance_public_ips" {
  value = aws_instance.example[*].public_ip
}

# Write the public IPs to a file
resource "local_file" "public_ips" {
  content  = format("[all]\n%s", join("\n", aws_instance.example[*].public_ip))
  filename = "${path.module}/public_ips.txt"
}
