resource "aws_iam_policy" "ecr_policy" {
  name        = "jenkins-ecr-policy"
  description = "Policy to allow Jenkins access to ECR"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:PutImage",
          "ecr:ListImages"
        ]
        Effect   = "Allow"
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