terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-s3-state-snowflake"
    key            = "snowflake/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-state-lock-dynamo"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-2"
}