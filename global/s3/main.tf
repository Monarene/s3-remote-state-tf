terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
       # Replace this with your bucket name!
      bucket = "<YOUR_S3_BUCKET_HERE>"
      key = "global/s3/terraform.tfstate"
      region= "us-east-2"
      # Replace this with your DynamoDB table name!
      dynamodb_table = "YOUR_DYNAMODB_TABLE_NAME_HERE"
      encrypt        = true
     }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "terraform_state" {

  bucket = var.bucket_name
  force_destroy = true
  versioning {
    enabled = true
  }

  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
