# 1.- Generate a secret
# 2.- Reference/import the secret

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.regions[0]
}

resource "aws_secretsmanager_secret" "test_secret" {
  description             = "secrets manager test secret"
  name                    = "test_secret"
  recovery_window_in_days = 7
}

