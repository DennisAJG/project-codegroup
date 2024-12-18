variable "vpc_cidr_project_codegroup_apps" {
  description = "CIDR da VPC para o project codegroup apps"
  default     = "10.1.0.0/16"
}

variable "cidr_blocks_public_subnet_1_project_codegroup_apps" {
  description = "CIDR da subnet publica 1 para o project codegroup apps"
  default     = "10.1.1.0/24"
}

variable "cidr_blocks_private_subnet_1_project_codegroup_apps" {
  description = "CIDR da subnet privada 1 para o project codegroup apps"
  default     = "10.1.2.0/24"
}

variable "cidr_blocks_public_subnet_2_project_codegroup_apps" {
  description = "CIDR da subnet publica 2 para o project codegroup apps"
  default     = "10.1.3.0/24"
}

variable "cidr_blocks_private_subnet_2_project_codegroup_apps" {
  description = "CIDR da subnet privada 2 para o project codegroup apps"
  default     = "10.1.4.0/24"
}

variable "aws_default_region" {
  description = "Regiao padrao usado para o project codegroup apps"
  default     = "us-east-1"
}

variable "project_codegroup_apps" {
  description = "Projeto que sera usada para o tfstate da apps"
  default     = "codegroup_apps"
}

