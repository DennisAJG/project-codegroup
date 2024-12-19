resource "aws_iam_group_policy_attachment" "attach_ecr_policy_jenkins_codegroup" {
  group      = aws_iam_group.jenkins_group_codegroup.name
  policy_arn = aws_iam_policy.ecr_policy.arn
}

resource "aws_iam_group_policy_attachment" "attach_ec2_rds_policy" {
  group      = aws_iam_group.jenkins_group_codegroup.name
  policy_arn = aws_iam_policy.ec2_rds_admin_policy.arn
}