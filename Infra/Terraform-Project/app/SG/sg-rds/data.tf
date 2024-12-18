data "terraform_remote_state" "network_apps_codegroup_remote_state" {
  backend = "s3"
  config = {
    bucket = "codegroup-apps-tfstate-s3-project"
    key    = "codegroup-apps/network/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "apps_ip_private_sever" {
  backend = "s3"
  config = {
    bucket = "codegroup-devops-tfstate-s3-project"
    key    = "codegroup-devops/ec2/apps/terraform.tfstate"
    region = "us-east-1"
  }
}