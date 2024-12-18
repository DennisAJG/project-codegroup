terraform {
  required_version = ">=1.7.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.38.0"
    }

    vault = {
      source  = "hashicorp/vault"
      version = "3.18.0"
    }
  }

  backend "s3" {
    bucket = "codegroup-apps-tfstate-s3-project"
    key    = "codegroup-apps/rds/apps/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "user-codegroup"

  default_tags {
    tags = {
      owner      = "user-codegroup"
      managed-by = "terraform-aws"
    }
  }
}

provider "vault" {
  address          = "https://127.0.0.1:8200"
  token            = var.vault_token_project_codegroup
  skip_tls_verify  = true
  namespace        = ""
  skip_child_token = true
}