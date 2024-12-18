resource "aws_security_group" "sg_jenkins_devops_security_project_codegroup" {
  name   = var.project_codegroup_devops
  vpc_id = data.terraform_remote_state.network_devops_codegroup_remote_state.outputs.vpc_id_project_codegroup_devops


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }


  #ingress {
  #  description = "port-all"
  #  from_port   = 0
  #  to_port     = 0
  #  protocol    = -1
  #  cidr_blocks = ["0.0.0.0/0"]
  #}

  ingress {
    description = "ssh via maquina local"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.access_maquina_local]
  }


  tags = merge(
    local.common_tags,
    {
      Name    = "${var.sg_name}"
      Projeto = "${var.project_codegroup_devops}"
    }
  )

}