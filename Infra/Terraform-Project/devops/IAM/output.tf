output "jenkins_access_key" {
  value = aws_iam_access_key.jenkins_access_key_codegroup.id
}

output "jenkins_secret_key" {
  value     = aws_iam_access_key.jenkins_access_key_codegroup.secret
  sensitive = true
}