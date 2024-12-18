terraform {
  required_version = ">=1.7.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.38.0"
    }
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