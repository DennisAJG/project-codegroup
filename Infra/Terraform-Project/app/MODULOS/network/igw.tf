resource "aws_internet_gateway" "igw_module_codegroup_apps" {
  vpc_id = aws_vpc.vpc_modulo_project_codegroup_apps.id

  tags = merge(
    local.common_tags,
    {
      Name    = "igw-${var.project_codegroup_apps_name}-${var.environment_codegroup_apps}"
      Projeto = "${var.project_codegroup_apps}"
      Environment = "${var.environment_codegroup_apps}"
    }
  )
}
