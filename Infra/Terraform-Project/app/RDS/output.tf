# outputs.tf
output "db_instance_endpoint" {
  description = "Endpoint for the RDS instance"
  value       = aws_db_instance.database_project_apps_codegroup.endpoint
}

output "db_instance_arn" {
  description = "ARN of the RDS instance"
  value       = aws_db_instance.database_project_apps_codegroup.arn
}