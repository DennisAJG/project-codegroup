output "sg_name_apps_databse_project_codegroup" {
  description = "nome do security group criado."
  value       = aws_security_group.sg_apps_database_security_project_codegroup.name
}

output "sg_apps_database_security_project_codegroup" {
  description = "id do security group criado."
  value       = aws_security_group.sg_apps_database_security_project_codegroup.id
}