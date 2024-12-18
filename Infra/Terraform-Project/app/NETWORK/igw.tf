resource "aws_internet_gateway" "igw_project_codegroup_apps" {
  vpc_id = aws_vpc.vpc_project_codegroup_apps.id

  tags = local.common_tags
}