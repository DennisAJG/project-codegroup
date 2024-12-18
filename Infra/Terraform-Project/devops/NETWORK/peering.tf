resource "aws_vpc_peering_connection" "vpc_peering_connection_project_codegroup_apps_project_codegroup_devops" {
  peer_vpc_id = data.terraform_remote_state.network_apps_codegroup_remote_state.outputs.vpc_id_project_codegroup_apps
  vpc_id      = aws_vpc.vpc_project_codegroup_devops.id
  auto_accept = true

  tags = {
    Name = "${var.project_codegroup_devops}-vpc-peering-connection-${var.project_codegroup_apps}"
  }
}

resource "aws_route" "route_project_codegroup_devops_apps" {
  route_table_id            = var.id_route_table_public_project_codegroup_devops
  destination_cidr_block    = data.terraform_remote_state.network_apps_codegroup_remote_state.outputs.vpc_cidr_project_codegroup_apps
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering_connection_project_codegroup_apps_project_codegroup_devops.id

}

resource "aws_route" "route_project_codegroup_apps_devops" {
  route_table_id            = data.terraform_remote_state.network_apps_codegroup_remote_state.outputs.id_route_table_public_project_codegroup_apps
  destination_cidr_block    = var.vpc_cidr_project_codegroup_devops
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering_connection_project_codegroup_apps_project_codegroup_devops.id

}

