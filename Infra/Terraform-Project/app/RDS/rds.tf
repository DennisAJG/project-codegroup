resource "aws_db_instance" "database_project_apps_codegroup" {
  identifier           = var.identifiers_database_project_apps_codegroup
  allocated_storage    = var.allocated_storage_database_project_apps_codegroup
  storage_type         = var.storage_type_database_project_apps_codegroup
  engine               = var.engine_database_project_apps_codegroup
  engine_version       = var.engine_version_database_project_apps_codegroup
  instance_class       = var.instance_class_database_project_apps_codegroup
  db_name              = var.db_name_database_project_apps_codegroup
  username             = data.vault_kv_secret_v2.db_credentials.data["db_username"]
  password             = data.vault_kv_secret_v2.db_credentials.data["db_password"]
  db_subnet_group_name = aws_db_subnet_group.subnet_group_database_project_apps_codegroup.id
  vpc_security_group_ids = [
    data.terraform_remote_state.sg_project_codegroup_apps_remote.outputs.sg_apps_database_security_project_codegroup
  ]
  skip_final_snapshot     = true
  multi_az                = true
  publicly_accessible     = false
  deletion_protection     = false
  backup_retention_period = 5 # Quantidade de dias para manter os backups automáticos


  tags = merge(
    local.common_tags,
    {
      Name               = "${var.db_name_database_project_apps_codegroup}"
      Projeto            = "${var.project_codegroup_apps}"
      ScheduledStartStop = "False"
      DNS                = "sem DNS"
      Ansible            = "False"
      ExtendVolume       = "true"
    }
  )

}
