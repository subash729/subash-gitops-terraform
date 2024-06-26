provider "aws" {
  alias  = "new"
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "subash-terraform-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "subash-frontend.terraform_state1"
  }
}

module "webapp1" {
  source   = "./modules/workflow/frontend"
  bucket = "${var.environment}.subash-frontend"
  dynamodb_table_name = "${var.environment}.frontend.table"
}

module "webapp2" {
  source   = "./modules/workflow/frontend"
  bucket = "dev.subash-frontend"
  dynamodb_table_name = "dev.frontend.table"
}

