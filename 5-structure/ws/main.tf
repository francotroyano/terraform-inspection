terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}
locals { environment_name = terraform.workspace }

provider "aws" {
  region     = "eu-west-1"
  # access_key = "NO"
  # secret_key = "PE"
}

resource "aws_instance" "example" {
  count         = terraform.workspace == "prod" ? 2 : 1
  ami           = "ami-062a49a8152e4c031" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"
  subnet_id     = module.vpc.public_subnets[0]
  tags = {
    env = terraform.workspace
    Name = format("%s-%s",terraform.workspace,count.index)
  }
}