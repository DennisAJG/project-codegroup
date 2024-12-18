variable "project_codegroup_devops" {
  description = "Projeto que sera usada para o tfstate da devops"
  default     = "codegroup_devops"
}


variable "sg_name" {
  default = "sg_jenkins_devops"
}

variable "access_maquina_local" {
  description = "Variavel para acesso a maquina do jenkins via maquina local"
  # execute o comando antes export TF_VAR_access_maquina_local="$(curl -4 ifconfig.me)/32"
}