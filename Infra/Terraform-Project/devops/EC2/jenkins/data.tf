data "terraform_remote_state" "network_project_codegroup_devops_remote" {
  backend = "s3"
  config = {
    bucket = "codegroup-devops-tfstate-s3-project"
    key    = "codegroup-devops/network/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "sg_project_codegroup_devops_remote" {
  backend = "s3"
  config = {
    bucket = "codegroup-devops-tfstate-s3-project"
    key    = "codegroup-devops/sg/sg-jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}

data "vault_kv_secret_v2" "ansible_ssh_key_public" {
  mount = "kv"          
  name  = "ssh-keys"   
}