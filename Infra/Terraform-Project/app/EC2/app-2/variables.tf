variable "instance_type_apps" {
  description = "tipo de instancia usado para projetos apps"
  default     = "t2.micro"
}

variable "server_name" {
  description = "Nome do servidor"
  default     = "apps_server_codegroup"
}

variable "project_codegroup_apps" {
  description = "Projeto que sera usada para o tfstate da apps"
  default     = "codegroup_apps"
}

variable "vault_token_project_codegroup" {
  description = "token de acesso a Vault para incluir a chave publica do ansible "
  type        = string
}

variable "vault_token_project_codegroup_jenkins_for_apps" {
  description = "token de acesso a Vault para incluir a chave publica do jenkins  "
  type        = string
}


variable "aws_default_region" {
  description = "Regiao padrao usado para o project codegroup apps"
  type        = string
}

#variable "project_codegroup_apps" {
#  description = "Projeto que sera usada para o tfstate da apps"
#  default     = "codegroup_apps"
#}


variable "project_codegroup_apps_name" {
  description = "Name para o project codegroup apps"
  type        = string
}

variable "environment_codegroup_apps" {
  description = "Environment para o project codegroup apps"
  type        = string
}