output "bucket_name_app_codegroup_dados" {
  description = "output do nome da bucket que será usado para dados dos apps"
  value       = aws_s3_bucket.bucket_codegroup_apps_dados.id
}

output "bucket_arn_app_codegroup_dados" {
  description = "output do nome da bucket que será usado para dados dos apps"
  value       = aws_s3_bucket.bucket_codegroup_apps_dados.arn
}