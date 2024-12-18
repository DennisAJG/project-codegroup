resource "aws_route_table" "rt_project_codegroup_devops" {
  vpc_id = aws_vpc.vpc_project_codegroup_devops.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_project_codegroup_devops.id
  }

  tags = local.common_tags
}