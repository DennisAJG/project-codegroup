output "bucket_name_app_getrak_tfstate" {
  description = "output do nome da bucket que será usado para o tfstate do devops infra"
  value = aws_s3_bucket.bucket_codegroup_devops_tfstate.id
}