variable "bucket_name" {
  description = "The name of the S3 bucket. Must be globally unique."
  type        = string
  default = "<YOUR_S3_BUCKET_HERE>"
}

variable "table_name" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default = "YOUR_DYNAMODB_TABLE_NAME_HERE"
}