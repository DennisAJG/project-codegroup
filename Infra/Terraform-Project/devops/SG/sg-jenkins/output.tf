output "sg_name_jenkins_project_codegroup" {
  description = "nome do security group criado."
  value       = aws_security_group.sg_jenkins_devops_security_project_codegroup.name
}

output "sg_jenkins_security_project_codegroup" {
  description = "id do security group criado."
  value       = aws_security_group.sg_jenkins_devops_security_project_codegroup.id
}