provider "aws" {
  region = "us-east-1"
}


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.4.0"
    }
  }
  # using terraform cloud as backend 
  backend "remote" {
    #          The name of your Terraform Cloud organization.
    organization = "revolgy-infra"
    #
    #         # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "production"
    }
  }
}

module "eks" {
  source      = "../terraform/module/eks/"
  db_username = var.db_username
  db_password = var.db_password
  az-a        = "us-east-1a"
  az-b        = "us-east-1b"
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}