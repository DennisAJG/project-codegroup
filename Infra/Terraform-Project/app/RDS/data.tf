data "terraform_remote_state" "network_project_codegroup_apps_remote" {
  backend = "s3"
  config = {
    bucket = "codegroup-apps-tfstate-s3-project"
    key    = "codegroup-apps/network/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "sg_project_codegroup_apps_remote" {
  backend = "s3"
  config = {
    bucket = "codegroup-apps-tfstate-s3-project"
    key    = "codegroup-apps/sg/sg-apps/terraform.tfstate"
    region = "us-east-1"
  }
}

data "vault_kv_secret_v2" "db_credentials" {
  mount = "kv"
  name  = "credentials-database"
}
