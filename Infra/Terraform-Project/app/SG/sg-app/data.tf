data "terraform_remote_state" "network_apps_codegroup_remote_state" {
  backend = "s3"
  config = {
    bucket = "codegroup-apps-tfstate-s3-project"
    key    = "codegroup-apps/network/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "sg_jenkins_devops_ip_sever" {
  backend = "s3"
  config = {
    bucket = "codegroup-devops-tfstate-s3-project"
    key    = "codegroup-devops/infra/ec2/jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}