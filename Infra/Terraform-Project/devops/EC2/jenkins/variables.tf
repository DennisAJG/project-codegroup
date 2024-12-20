variable "instance_type_devops" {
  description = "tipo de instancia usado para projetos devops"
  default     = "t2.micro"
}

variable "server_name" {
  description = "Nome do servidor"
  default     = "devops_jenkins_server_codegroup"
}

variable "project_codegroup_devops" {
  description = "Projeto que sera usada para o tfstate da devops"
  default     = "codegroup_devops"
}

variable "vault_token_project_codegroup" {
  description = "token de acesso a Vault para incluir a chave publica do ansible "
  type        = string
}