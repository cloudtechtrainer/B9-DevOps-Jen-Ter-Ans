# main.tf

variable "ami" {
  description = "AMI details"
  type        = string
}

variable "key" {
  description = "The name of the EC2 key pair to associate with the instances."
  type        = string
}
