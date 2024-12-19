output "name_billing" {
  value = aws_cur_report_definition.cost_report_codegroup.report_name
}

output "s3_prefix" {
  value = aws_cur_report_definition.cost_report_codegroup.s3_prefix
}