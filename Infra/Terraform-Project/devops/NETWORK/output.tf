output "vpc_id_project_codegroup_devops" {
  description = "ID da vpc que será usado no projeto codegroup devops"
  value       = aws_vpc.vpc_project_codegroup_devops.id
}

output "vpc_cidr_project_codegroup_devops" {
  description = "CIDR da vpc que será usado no projeto codegroup devops"
  value       = aws_vpc.vpc_project_codegroup_devops.cidr_block
}

output "id_subnet_public_1_project_codegroup_devops" {
  description = "id da subnet publica 1 que será usado no projeto codegroup devops"
  value       = aws_subnet.public_subnet_1_project_codegroup_devops.id
}

output "id_subnet_public_2_project_codegroup_devops" {
  description = "id da subnet publica 2 que será usado no projeto codegroup devops"
  value       = aws_subnet.public_subnet_2_project_codegroup_devops.id
}

output "id_subnet_private_1_project_codegroup_devops" {
  description = "id da subnet privada 1 que será usado no projeto codegroup devops"
  value       = aws_subnet.private_subnet_1_project_codegroup_devops.id
}

output "id_subnet_private_2_project_codegroup_devops" {
  description = "id da subnet privada 2 que será usado no projeto codegroup devops"
  value       = aws_subnet.private_subnet_2_project_codegroup_devops.id
}

output "cidr_blocks_public_subnet_1_project_codegroup_devops" {
  description = "CIDR da subnet publica 1 para o project codegroup devops"
  value       = aws_subnet.public_subnet_1_project_codegroup_devops.cidr_block
}

output "cidr_blocks_public_subnet_2_project_codegroup_devops" {
  description = "CIDR da subnet publica 2 para o project codegroup devops"
  value       = aws_subnet.public_subnet_2_project_codegroup_devops.cidr_block
}

output "cidr_blocks_private_subnet_1_project_codegroup_devops" {
  description = "CIDR da subnet privada 1 para o project codegroup devops"
  value       = aws_subnet.private_subnet_1_project_codegroup_devops.cidr_block
}

output "cidr_blocks_private_subnet_2_project_codegroup_devops" {
  description = "CIDR da subnet privada 2 para o project codegroup devops"
  value       = aws_subnet.private_subnet_2_project_codegroup_devops.cidr_block
}

output "id_igw_project_codegroup_devops" {
  description = "id da igw que será usado no projeto codegroup devops"
  value       = aws_internet_gateway.igw_project_codegroup_devops.id
}

output "id_route_table_public_project_codegroup_devops" {
  description = "id da route table publica que.awtextra usado no projeto codegroup devops"
  value       = aws_route_table.rt_project_codegroup_devops.id
}

output "vpc_peering_id" {
  description = "ID do VPC Peering Connection"
  value       = aws_vpc_peering_connection.vpc_peering_connection_project_codegroup_apps_project_codegroup_devops.id
}