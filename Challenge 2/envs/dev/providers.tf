provider "aws" {
  alias  = "us-east-1"
  region = var.region
}


terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "s3" {}
}
