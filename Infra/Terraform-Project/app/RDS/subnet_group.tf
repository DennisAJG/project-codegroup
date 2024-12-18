resource "aws_db_subnet_group" "subnet_group_database_project_apps_codegroup" {
  name        = "subnet-group-database-project-apps-codegroup"
  description = "Subnets para o RDS-Mysql database-project-apps-codegroup"
  subnet_ids = [
    data.terraform_remote_state.network_project_codegroup_apps_remote.outputs.id_subnet_private_1_project_codegroup_apps,
    data.terraform_remote_state.network_project_codegroup_apps_remote.outputs.id_subnet_private_2_project_codegroup_apps
  ]

  tags = merge(
    local.common_tags,
    {
      Name    = "${var.db_name_database_project_apps_codegroup}"
      Projeto = "${var.project_codegroup_apps}"
    }
  )
}