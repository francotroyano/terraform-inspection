terraform {
  backend "s3" {
    bucket         = "hand-on-tf-state"
    key            = "12-cacheDir/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "hand-on-tf-locks"
    encrypt        = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = "~>1.6"
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "test_instance2" {
  ami           = "ami-0c45689cf7ad8a412"
  instance_type = "t2.micro"
}