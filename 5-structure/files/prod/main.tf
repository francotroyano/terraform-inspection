terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region     = "eu-wesy-1"
  # access_key = "NO"
  # secret_key = "PE"
}

resource "aws_instance" "example" {
  ami           = "ami-062a49a8152e4c031" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"
}