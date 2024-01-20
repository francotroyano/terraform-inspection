terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
      }
    }
}

provider aws {
    region = "eu-west-1"
}

# locals {
#     extra_tag = "extra-tag"
#     Env = "Prod"
# }

resource "aws_instance" "prueba" {
    ami = "ami-062a49a8152e4c031"
    instance_type = "t2.micro"
    tags = {
        Env = "Prod"
    }
}

