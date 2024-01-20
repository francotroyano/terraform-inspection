terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}



module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.0.1"
  bucket  = "test-bucket-fds6468d1s6f51fee842"
  acl     = "private"

  versioning = {
    enabled = true
  }
  allowed_kms_key_arn = aws_kms_key.clave.arn
}


resource "aws_kms_key" "clave" {
  description             = "KMS key to crypt SSE-KMS S3 bucket"
  deletion_window_in_days = 7
}

