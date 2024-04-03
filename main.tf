provider "aws" {
  alias  = "new"
  region = "us-east-1"
}

module "webapp1" {
    source = "./modules/workflow/frontend"
    web_name = "subashchy729.com"
}
