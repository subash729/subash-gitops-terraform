variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "environment" {
  description = "The environment (prod or dev)"
  default     = "dev"
}

variable "dynamodb_table_name" {
description = "table name" 
default = "dev.frontend.table" 
}




