terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.66.1"
    }
  }

# configuration of backend with aws s3 

backend "s3" {
     key     = "vpc/terraform.tfstate"
     region  = "us-east-1"
     bucket  = "skn-gitlab-tf-backend"
     #profile = "default"
     # profile = dev
   }

}


locals {
  infra_env = terraform.workspace
}