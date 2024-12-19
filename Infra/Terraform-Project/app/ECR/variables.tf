variable "ecr_name_apps_codegroup" {
  description = "Nome do repositorio"
  default     = "flask-restapi-apps-codegroup"
}

variable "project_codegroup_apps_ecr" {
  description = "Projeto que sera usada para o tfstate da apps"
  default     = "flask-restapi-apps"
}