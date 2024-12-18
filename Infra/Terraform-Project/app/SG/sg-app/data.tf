data "terraform_remote_state" "network_apps_codegroup_remote_state" {
  backend = "s3"
  config = {
    bucket = "codegroup-apps-tfstate-s3-project"
    key    = "codegroup-apps/network/terraform.tfstate"
    region = "us-east-1"
  }
}