output "vpc_id_project_codegroup_apps" {
  description = "ID da vpc que será usado no projeto codegroup apps"
  value       = aws_vpc.vpc_project_codegroup_apps.id
}

output "vpc_cidr_project_codegroup_apps" {
  description = "CIDR da vpc que será usado no projeto codegroup apps"
  value       = aws_vpc.vpc_project_codegroup_apps.cidr_block
}

output "id_subnet_public_1_project_codegroup_apps" {
  description = "id da subnet publica 1 que será usado no projeto codegroup apps"
  value       = aws_subnet.public_subnet_1_project_codegroup_apps.id
}

output "id_subnet_public_2_project_codegroup_apps" {
  description = "id da subnet publica 2 que será usado no projeto codegroup apps"
  value       = aws_subnet.public_subnet_2_project_codegroup_apps.id
}

output "id_subnet_private_1_project_codegroup_apps" {
  description = "id da subnet privada 1 que será usado no projeto codegroup apps"
  value       = aws_subnet.private_subnet_1_project_codegroup_apps.id
}

output "id_subnet_private_2_project_codegroup_apps" {
  description = "id da subnet privada 2 que será usado no projeto codegroup apps"
  value       = aws_subnet.private_subnet_2_project_codegroup_apps.id
}

output "cidr_blocks_public_subnet_1_project_codegroup_apps" {
  description = "CIDR da subnet publica 1 para o project codegroup apps"
  value       = aws_subnet.public_subnet_1_project_codegroup_apps.cidr_block
}

output "cidr_blocks_public_subnet_2_project_codegroup_apps" {
  description = "CIDR da subnet publica 2 para o project codegroup apps"
  value       = aws_subnet.public_subnet_2_project_codegroup_apps.cidr_block
}

output "cidr_blocks_private_subnet_1_project_codegroup_apps" {
  description = "CIDR da subnet privada 1 para o project codegroup apps"
  value       = aws_subnet.private_subnet_1_project_codegroup_apps.cidr_block
}

output "cidr_blocks_private_subnet_2_project_codegroup_apps" {
  description = "CIDR da subnet privada 2 para o project codegroup apps"
  value       = aws_subnet.private_subnet_2_project_codegroup_apps.cidr_block
}

output "id_igw_project_codegroup_apps" {
  description = "id da igw que será usado no projeto codegroup apps"
  value       = aws_internet_gateway.igw_project_codegroup_apps.id
}

output "id_route_table_public_project_codegroup_apps" {
  description = "id da route table publica que.awtextra usado no projeto codegroup apps"
  value       = aws_route_table.rt_project_codegroup_apps.id
}
