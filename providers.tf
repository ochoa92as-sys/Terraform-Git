terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.36.0, <4.47.0, !=4.46.0"
    }

    random = {
      source  = "hashicorp/random"
    }
  }

   required_version = "~>1.12.0"

}


provider "aws" {
  region = "us-east-1"
  access_key = var.accesskey
  secret_key = var.secretkey
  default_tags {
    tags = var.tags
  }
}