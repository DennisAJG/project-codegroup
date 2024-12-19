output "ecr_repository_url_flask_restapi_repo_apps_codegroup" {
  description = "URL do repositório ECR"
  value       = aws_ecr_repository.flask_restapi_repo_project_apps_codegroup.repository_url
}