output "ssm_parameter" {
  #value = values(aws_instance.example).*.private_ip
  #   value = { for service, i in aws_instance.example : service => i.private_ip }
  value = aws_kms_key.test_terraform_key.id
}