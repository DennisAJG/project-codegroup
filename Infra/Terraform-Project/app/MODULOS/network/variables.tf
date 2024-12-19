variable "vpc_cidr_project_codegroup_apps" {
  description = "CIDR da VPC para o project codegroup apps"
  type = string
}

variable "cidr_blocks_public_subnet_1_project_codegroup_apps" {
  description = "CIDR da subnet publica 1 para o project codegroup apps"
  type = string
}

variable "cidr_blocks_private_subnet_1_project_codegroup_apps" {
  description = "CIDR da subnet privada 1 para o project codegroup apps"
  type = string
}

variable "cidr_blocks_public_subnet_2_project_codegroup_apps" {
  description = "CIDR da subnet publica 2 para o project codegroup apps"
  type = string
}

variable "cidr_blocks_private_subnet_2_project_codegroup_apps" {
  description = "CIDR da subnet privada 2 para o project codegroup apps"
  type = string
}

variable "aws_default_region" {
  description = "Regiao padrao usado para o project codegroup apps"
  type = string
}

variable "project_codegroup_apps" {
  description = "Projeto que sera usada para o tfstate da apps"
  default     = "codegroup_apps"
}


variable "project_codegroup_apps_name" {
  description = "Name para o project codegroup apps"
  type = string
}

variable "environment_codegroup_apps" {
  description = "Environment para o project codegroup apps"
  type = string
}