provider "aws" {
  region  = "us-east-1"
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
      name = "staging"
    }
  }
}

module "eks" {
  source = "../terraform/module/eks/"
}
