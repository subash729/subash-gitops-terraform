provider "aws" {
  alias  = "new"
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "prod.subash-frontend"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "subash_terraform_dynamo_db"
  }
}

terraform {
  backend "s3" {
    bucket         = "dev.subash-frontend"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "subash_terraform_dynamo_db"
  }
}

locals {
  bucket_name = var.web_name == "prod.subash-frontend" ? "prod-subash-frontend-bucket" : "dev-subash-frontend-bucket"
}

module "webapp1" {
  source   = "./modules/workflow/frontend"
  web_name = var.web_name
}
