resource "aws_ecr_repository" "flask_restapi_repo_project_apps_codegroup" {
  name = var.ecr_name_apps_codegroup

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = merge(
    local.common_tags,
    {
      Name    = "${var.ecr_name_apps_codegroup}"
      Projeto = "${var.project_codegroup_apps_ecr}"
    }
  )
}