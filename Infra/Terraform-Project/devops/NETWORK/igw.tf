resource "aws_internet_gateway" "igw_project_codegroup_devops" {
  vpc_id = aws_vpc.vpc_project_codegroup_devops.id

  tags = local.common_tags
}