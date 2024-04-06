provider "aws" {
  alias  = "new"
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "subash-terraform-state"
    key            = "terraform_state"
    region         = "us-east-1"
    dynamodb_table = "prod.frontend.table"
  }
}

module "webapp1" {
  source   = "./modules/workflow/frontend"
  web_name = "${var.environment}.subash-frontend"
  dynamodb_table_name = "${var.environment}.frontend.table"
}

module "webapp2" {
  source   = "./modules/workflow/frontend"
  web_name = "subash-frontend-test"
  dynamodb_table_name = "${var.environment}.frontend.table"
}