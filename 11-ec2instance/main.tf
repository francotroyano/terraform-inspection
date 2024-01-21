terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }  
}

provider aws {
    region = "eu-west-1"
}

resource "aws_instance" "test_instance" {
    ami = "ami-0e9107ed11be76fde"
    instance_type = "t2.micro"
}