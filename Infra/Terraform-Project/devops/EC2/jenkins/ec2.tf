resource "aws_instance" "sever_jenkins_project_devops_codegroup" {
  ami                         = data.aws_ami.codegroup_ami_devops.id
  instance_type               = var.instance_type_devops
  subnet_id                   = data.terraform_remote_state.network_project_codegroup_devops_remote.outputs.id_subnet_public_1_project_codegroup_devops
  key_name                    = "project-aws"
  associate_public_ip_address = true
  #iam_instance_profile = "AmazonSSMManagedInstanceCore"
  vpc_security_group_ids = [data.terraform_remote_state.sg_project_codegroup_devops_remote.outputs.sg_jenkins_security_project_codegroup]
  security_groups        = [data.terraform_remote_state.sg_project_codegroup_devops_remote.outputs.sg_jenkins_security_project_codegroup]

  tags = merge(
    local.common_tags,
    {
      Name               = "${var.server_name}"
      Projeto            = "${var.project_codegroup_devops}"
      ScheduledStartStop = "False"
      DNS                = "sem DNS"
      Ansible            = "False"
      ExtendVolume       = "true"
    }
  )


}


