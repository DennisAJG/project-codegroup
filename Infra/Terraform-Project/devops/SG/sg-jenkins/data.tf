data "terraform_remote_state" "network_devops_codegroup_remote_state" {
  backend = "s3"
  config = {
    bucket = "codegroup-devops-tfstate-s3-project"
    key    = "codegroup-devops/network/terraform.tfstate"
    region = "us-east-1"
  }
}