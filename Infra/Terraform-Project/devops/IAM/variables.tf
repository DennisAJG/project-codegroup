variable "name_group_iam_codegroup" {
  description = "Nome do grupo IAM para o project codegroup devops"
  default     = "jenkins-group-codegroup"
}

variable "name_user_iam_codegroup" {
  description = "Nome do user IAM para o project codegroup devops"
  default     = "jenkins-user-codegroup"
}

variable "aws_s3_app_dados_arn" {
  description = "ARN da bucket que sera usada para os dados dos apps"
  default = "arn:aws:s3:::codegroup-apps-dados-s3-project"
}