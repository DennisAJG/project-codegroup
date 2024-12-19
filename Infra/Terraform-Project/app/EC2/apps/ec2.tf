resource "aws_instance" "sever_project_apps_codegroup" {
  ami                         = data.aws_ami.codegroup_ami_apps.id
  instance_type               = var.instance_type_apps
  subnet_id                   = data.terraform_remote_state.network_project_codegroup_apps_remote.outputs.id_subnet_public_1_project_codegroup_apps
  key_name                    = "project-aws"
  associate_public_ip_address = true
  vpc_security_group_ids = [data.terraform_remote_state.sg_project_codegroup_apps_remote.outputs.sg_apps_security_project_codegroup]
  security_groups        = [data.terraform_remote_state.sg_project_codegroup_apps_remote.outputs.sg_apps_security_project_codegroup]

  iam_instance_profile        = data.terraform_remote_state.iam_project_codegroup_apps_remote.outputs.iam_instance_profile

  user_data = <<-EOF
              #!/bin/bash
              echo "${data.vault_kv_secret_v2.ansible_ssh_key_public.data["ansible_key"]}" >> /home/ubuntu/.ssh/authorized_keys
              echo "${data.vault_kv_secret_v2.jenkins_ssh_key_public.data["jenkins_key"]}" >> /home/ubuntu/.ssh/authorized_keys
              chmod 600 /home/ubuntu/.ssh/authorized_keys
              chown ubuntu:ubuntu /home/ubuntu/.ssh/authorized_keys
              EOF



  tags = merge(
    local.common_tags,
    {
      Name               = "${var.server_name}"
      Projeto            = "${var.project_codegroup_apps}"
      ScheduledStartStop = "False"
      DNS                = "sem DNS"
      Ansible            = "False"
      ExtendVolume       = "true"
    }
  )

}


