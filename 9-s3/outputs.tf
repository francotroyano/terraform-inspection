output "s3bucketARN" {
  #   value = aws_s3_bucket.test_bucket.arn
  value = module.s3_bucket.s3_bucket_id
}

output "bucket_domain_name" {
  value = aws_s3_bucket.example.bucket_domain_name
}