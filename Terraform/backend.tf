# backend.tf
terraform {
  backend "s3" {
    bucket         = "aws-terraform-backend-output"
    key            = "devops/ter-ans/terraform.tfstate"
    region         = "ap-south-2"
    encrypt        = true                 # State file encryption
  }
}
