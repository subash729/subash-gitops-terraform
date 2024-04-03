locals {
  global_tags = {
    Name      = "subash-frontend"
    Creator   = "subaschy729@gmail.com"
    Project   = "Intern"
    Deletable = "yes"
  }
}


module "s3_bucket" {
  source      = "../../Resources/s3-bucket/"
  region      = "us-east-1"
  bucket_name = var.web_name

  tags = local.global_tags
}


module "s3_bucket_policy" {
  source      = "../../Resources/s3-bucket-policy"
  bucket_name = module.s3_bucket.bucket_name
  bucket_arn  = module.s3_bucket.bucket_arn
}