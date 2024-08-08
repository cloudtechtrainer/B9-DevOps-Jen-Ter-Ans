# main.tf

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
}

# Create a new EC2 instance and associate it with the security group
resource "aws_instance" "example" {
  count = 4 
  ami           = "ami-0d473344347276854"
  instance_type = "t2.micro"
  key_name = "Test-1"
  vpc_security_group_ids = [aws_security_group.ssh.id]
}
