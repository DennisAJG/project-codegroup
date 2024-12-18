resource "aws_route_table_association" "rt_association_public_subnet_1_project_codegroup_apps" {
  subnet_id      = aws_subnet.public_subnet_1_project_codegroup_apps.id
  route_table_id = aws_route_table.rt_project_codegroup_apps.id


}

resource "aws_route_table_association" "rt_association_public_subnet_2_project_codegroup_apps" {
  subnet_id      = aws_subnet.public_subnet_2_project_codegroup_apps.id
  route_table_id = aws_route_table.rt_project_codegroup_apps.id
}