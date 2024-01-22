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
  bucket  = "test-bucket-fds6468d1s6f51fee8424"
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



resource "aws_s3_bucket" "example" {
  bucket        = "bucket-enforce-http-55551151"
  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "example_s3_website" {
  bucket = aws_s3_bucket.example.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_policy" "enforce_https_policy" {
  bucket = aws_s3_bucket.example.id
  policy = data.aws_iam_policy_document.enforce_https_policy_doc.json
}

data "aws_iam_policy_document" "enforce_https_policy_doc" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    effect  = "Deny"
    actions = ["s3:*"]

    resources = [
      aws_s3_bucket.example.arn,
      "${aws_s3_bucket.example.arn}/*",
    ]

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }

  }
}