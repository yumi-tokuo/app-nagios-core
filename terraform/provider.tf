# PROVIDER
terraform {

  required_version = "~> 1.5.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.13"
    }
  }

  backend "s3" {
    bucket         = "tf-state-preparacao-titio-eh-foda"
    key            = "terraform.tfstate"
    dynamodb_table = "tf-state-lock-preparacao-titio-eh-foda"
    region         = "us-east-1"
  }
}
