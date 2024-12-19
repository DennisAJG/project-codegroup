output "bucket_name_app_codegroup_tfstate" {
  description = "output do nome da bucket que será usado para o tfstate dos apps"
  value       = aws_s3_bucket.bucket_codegroup_apps_tfstate.id
}