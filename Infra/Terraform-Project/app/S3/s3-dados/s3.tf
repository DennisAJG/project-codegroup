resource "aws_s3_bucket" "bucket_codegroup_apps_dados" {
  bucket = var.name_bucket_codegroup_apps_dados

  tags = local.common_tags
}

resource "aws_s3_bucket_public_access_block" "bucket_public_access_block_codegroup_apps_dados" {
  bucket = aws_s3_bucket.bucket_codegroup_apps_dados.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_versioning" "bucket_versioning_codegroup_apps_dados" {
  bucket = aws_s3_bucket.bucket_codegroup_apps_dados.id
  versioning_configuration {
    status = "Enabled"
  }
}