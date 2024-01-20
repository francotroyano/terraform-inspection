

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region     = "eu-west-1"
  # access_key = var.access_key
  # secret_key = var.secret_key
}

locals {
  extra_tag = "extra-tag"
}

resource "aws_instance" "example" {
  ami           = "ami-062a49a8152e4c031" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"
  subnet_id        = "subnet-07e4253ed3a40ed82"
  tags = {
    ExtraTag = local.extra_tag
  }
}