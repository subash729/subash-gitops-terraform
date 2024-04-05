# terraform {
#   required_version = ">= 1.0"

#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = ">= 5.27"
#     }
#   }
# }

# provider "aws" {
#   region = var.region
# }

resource "aws_s3_bucket" "subash_bucket" {
  bucket = var.bucket_name
  tags   = var.tags
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.subash_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


variable "tags" {
  description = "A map of tags to assign to the S3 bucket"
  type        = map(string)
  default     = {}
}

resource "aws_s3_bucket_versioning" "backend_bucket_versioning" {
  depends_on = [aws_s3_bucket.subash_bucket]
  bucket     = aws_s3_bucket.subash_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_object_lock_configuration" "backend_bucket_object_lock" {
  depends_on          = [aws_s3_bucket_versioning.backend_bucket_versioning]
  bucket              = aws_s3_bucket.subash_bucket.id
  object_lock_enabled = "Enabled"
}



