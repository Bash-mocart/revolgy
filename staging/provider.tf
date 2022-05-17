provider "aws" {
  region = "eu-west-3"
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
  source      = "../terraform/module/eks/"
  db_username = var.db_username
  db_password = var.db_password
  az-a        = "eu-west-3a"
  az-b        = "eu-west-3b"
  eks_node_group_iam_role = "eks_node_group_role_staging"
  eks_cluster_role = "eks_cluster_role_staging"
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}

output "postgresdns" {
  value     = module.eks.dns
  sensitive = true
}

