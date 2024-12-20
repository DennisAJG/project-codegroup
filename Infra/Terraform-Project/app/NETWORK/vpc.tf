resource "aws_vpc" "vpc_project_codegroup_apps" {
  cidr_block           = var.vpc_cidr_project_codegroup_apps
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  instance_tenancy     = "default"


  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_codegroup_apps}-vpc"
    }
  )

}