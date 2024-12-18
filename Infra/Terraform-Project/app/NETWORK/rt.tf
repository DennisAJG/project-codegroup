resource "aws_route_table" "rt_project_codegroup_apps" {
  vpc_id = aws_vpc.vpc_project_codegroup_apps.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_project_codegroup_apps.id
  }

  tags = local.common_tags
}