terraform {
  required_version = "~> 1.5.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0, <=5.6"
    }
  }

  backend "s3" {
    bucket         = "wdb-t101study-tfstate"
    key            = "test/terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "terraform-locks"
  }
}

provider "aws" {
  region  = var.region
  profile = var.account_profile
}