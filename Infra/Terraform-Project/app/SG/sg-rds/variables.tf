variable "project_codegroup_apps_database" {
  description = "Projeto que sera usada para o tfstate da devops"
  default     = "codegroup_apps_sg_rds"
}


variable "sg_name_apps_database" {
  default = "sg_apps_rds"
}

