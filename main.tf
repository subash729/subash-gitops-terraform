provider "aws" {
  alias  = "new"
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "prod.subash-terraform-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "prod.subash_terraform_dynamo_db"
  }
}

# terraform {
#   backend "s3" {
#     bucket         = "dev.subash-terraform-state"
#     key            = "terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "dev.subash_terraform_dynamo_db"
#   }
# }

# locals {
#   bucket_name = var.web_name == "prod.subash-frontend" ? "prod-subash-frontend-bucket" : "dev-subash-frontend-bucket"
# }

# terraform {
#   backend "s3" {
#     region         = "us-east-1"
#     dynamodb_table = "subash_terraform_dynamo_db"
#   }
# }

# terraform {
#   backend "s3" {
#     bucket = local.bucket_name
#     key    = var.web_name == "prod.subash-frontend" ? "terraform/prod.tfstate" : "terraform/dev.tfstate"
#     region = "us-east-1"
#   }
# }

module "webapp1" {
  source   = "./modules/workflow/frontend"
  web_name = "prod.subash-frontend"
}
