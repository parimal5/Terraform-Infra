provider "aws" {
  alias  = "useast1"
  region = var.region
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "s3" {
    #! This thee things are should be mentioned here OR /environments/PORD/backend/backend-prod.conf
    # bucket = "my-tf-state-prod"
    # key    = "prod/terraform.tfstate"
    # region = "us-east-1"
  }
}
