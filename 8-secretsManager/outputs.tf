output "ARN_data" {
    value = aws_secretsmanager_secret.test_secret.arn
}

output "ID_data" {
    value = aws_secretsmanager_secret.test_secret.id
}
