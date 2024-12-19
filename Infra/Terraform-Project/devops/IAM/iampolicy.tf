resource "aws_iam_policy" "ecr_policy" {
  name        = "jenkins-ecr-policy"
  description = "Policy to allow Jenkins access to ECR"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:PutImage",
          "ecr:ListImages",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload",
          "ecr:GetDownloadUrlForLayer" 
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy" "ec2_rds_admin_policy" {
  name        = "jenkins-ec2-rds-admin-policy"
  description = "Policy to allow Jenkins admin access to EC2 and RDS"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "ec2:*"
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action   = "rds:*"
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy" "s3_access_policy" {
  name        = "S3AccessPolicy"
  description = "Policy to allow EC2 read/write access to the S3 bucket"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = ["s3:GetObject", "s3:PutObject", "s3:ListBucket"],
        Effect   = "Allow",
        Resource = [
          var.aws_s3_app_dados_arn,
          "${var.aws_s3_app_dados_arn}/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role" "ec2_s3_role" {
  name = "EC2S3Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}
