output "ip_sever" {
  description = "ip publico elastic do servidor"
  value       = aws_eip.elastic_ip_project_codegroup.public_ip
}

output "instance_type" {
  description = "tipo de instance atribuida no servidor"
  value       = aws_instance.sever_jenkins_project_devops_codegroup.instance_type
}

output "key_name_ssh" {
  description = "chave ssh que será usado para o acesso a máquina "
  value       = aws_instance.sever_jenkins_project_devops_codegroup.key_name
}


output "security_group_id" {
  description = "id da security group"
  value       = data.terraform_remote_state.sg_project_codegroup_devops_remote.outputs.sg_jenkins_security_project_codegroup
}
