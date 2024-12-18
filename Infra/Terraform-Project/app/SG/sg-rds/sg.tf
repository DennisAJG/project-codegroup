resource "aws_security_group" "sg_apps_database_security_project_codegroup" {
  name   = var.project_codegroup_apps_database
  vpc_id = data.terraform_remote_state.network_apps_codegroup_remote_state.outputs.vpc_id_project_codegroup_apps


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow connection on PostgreSQL default port"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["${data.terraform_remote_state.apps_ip_private_sever.outputs.ip_private_server}/32"] 
  }


  tags = merge(
    local.common_tags,
    {
      Name    = "${var.sg_name_apps_database}"
      Projeto = "${var.project_codegroup_apps_database}"
    }
  )

}