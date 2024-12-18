resource "aws_route_table_association" "rt_association_public_subnet_1_project_codegroup_devops" {
  subnet_id      = aws_subnet.public_subnet_1_project_codegroup_devops.id
  route_table_id = aws_route_table.rt_project_codegroup_devops.id


}

resource "aws_route_table_association" "rt_association_public_subnet_2_project_codegroup_devops" {
  subnet_id      = aws_subnet.public_subnet_2_project_codegroup_devops.id
  route_table_id = aws_route_table.rt_project_codegroup_devops.id
}