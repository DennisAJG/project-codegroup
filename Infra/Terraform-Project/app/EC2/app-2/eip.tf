# Recurso para criar um Elastic IP
resource "aws_eip" "elastic_ip_project_app_flask_codegroup" {
  instance = aws_instance.sever_project_apps__flask_codegroup.id
  domain   = "vpc"
  tags = {
    Name = "codegroup-elastic-ip-apps-${var.environment_codegroup_apps}",
  }
}

# Associação do Elastic IP à instância EC2
resource "aws_eip_association" "eip_association_project_app_flask_codegroup" {
  instance_id   = aws_instance.sever_project_apps__flask_codegroup.id
  allocation_id = aws_eip.elastic_ip_project_app_flask_codegroup.id
}