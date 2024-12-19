output "jenkins_access_key" {
  value = aws_iam_access_key.jenkins_access_key_codegroup.id
}

output "jenkins_secret_key" {
  value     = aws_iam_access_key.jenkins_access_key_codegroup.secret
  sensitive = true
}

output "iam_instance_profile" {
  value = aws_iam_instance_profile.ec2_s3_instance_profile.name
}