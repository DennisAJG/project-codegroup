resource "aws_iam_user" "jenkins_user_codegroup" {
  name = var.name_user_iam_codegroup

  tags = local.common_tags
}

resource "aws_iam_user_group_membership" "jenkins_membership_codegroup" {
  user = aws_iam_user.jenkins_user_codegroup.name
  groups = [
    aws_iam_group.jenkins_group_codegroup.name
  ]
}

resource "aws_iam_access_key" "jenkins_access_key_codegroup" {
  user = aws_iam_user.jenkins_user_codegroup.name
}