resource "aws_route_table" "rt_project_modulo_codegroup_apps" {
  vpc_id = aws_vpc.vpc_modulo_project_codegroup_apps.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_module_codegroup_apps.id
  }

  tags = merge(
    local.common_tags,
    {
      Name    = "rt-${var.project_codegroup_apps_name}-${var.environment_codegroup_apps}"
      Projeto = "${var.project_codegroup_apps}"
      Environment = "${var.environment_codegroup_apps}"
    }
  )
}