provider "aws" {
  alias  = "new"
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "subash-terraform-state"
    key            = "terraform_state"
    region         = "us-east-1"
    dynamodb_table = "subash-frontend.terraform_state"
  }
}

module "webapp1" {
  source   = "./modules/workflow/frontend"
  web_name = "${var.environment}.subash-frontend"
}
