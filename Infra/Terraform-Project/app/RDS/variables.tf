variable "allocated_storage_database_project_apps_codegroup" {
  description = "quanto em GB será criado o RDS"
  type        = string
  default     = 50
}

variable "storage_type_database_project_apps_codegroup" {
  description = "Tipo de storage que será usado no RDS"
  type        = string
  default     = "gp2"
}

variable "engine_database_project_apps_codegroup" {
  description = "engine que será criado no RDS"
  type        = string
  default     = "mysql"
}

variable "engine_version_database_project_apps_codegroup" {
  description = "versão que será usado no engine"
  type        = string
  default     = "8.0.39"
}

variable "instance_class_database_project_apps_codegroup" {
  description = "tipo de instancia que será montada no cluster"
  type        = string
  default     = "db.t3.micro"
}

variable "db_name_database_project_apps_codegroup" {
  description = "Nome do Cluster RDS"
  type        = string
  default     = "databaseappscodegroup"
}


variable "vault_token_project_codegroup" {
  description = "token de acesso a Vault para incluir o usuario e senha do banco "
  type        = string
}

variable "identifiers_database_project_apps_codegroup" {
  description = "identificador usado para o RDS"
  type        = string
  default     = "databaseprojectappscodegroup"
}

variable "project_codegroup_apps" {
  description = "Projeto que sera usada para o tfstate da apps"
  default     = "codegroup_apps"
}