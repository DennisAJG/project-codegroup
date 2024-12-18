# Recurso para criar um Elastic IP
resource "aws_eip" "elastic_ip_project_codegroup" {
  instance = aws_instance.sever_jenkins_project_devops_codegroup.id
  domain   = "vpc"
  tags = {
    Name = "codegroup-elastic-ip-jenkins",
  }
}

# Associação do Elastic IP à instância EC2
resource "aws_eip_association" "eip_association_project_codegroup" {
  instance_id   = aws_instance.sever_jenkins_project_devops_codegroup.id
  allocation_id = aws_eip.elastic_ip_project_codegroup.id
}