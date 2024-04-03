provider "aws" {
  alias  = "new"
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "subash-terraform-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "subash_terraform_dynamo_db"
  }
}

module "webapp1" {
  source   = "./modules/workflow/frontend"
  web_name = "subash-frontend"
}
