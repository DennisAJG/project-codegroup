resource "aws_vpc" "vpc_modulo_project_codegroup_apps" {
  cidr_block           = var.vpc_cidr_project_codegroup_apps
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  instance_tenancy     = "default"


  tags = merge(
    local.common_tags,
    {
      Name    = "vpc-${var.project_codegroup_apps_name}-${var.environment_codegroup_apps}"
      Projeto = "${var.project_codegroup_apps}"
      Environment = "${var.environment_codegroup_apps}"
    }
  )

}