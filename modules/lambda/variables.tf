variable "function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "handler" {
  description = "The function entrypoint in your code"
  type        = string
}

variable "runtime" {
  description = "The runtime environment for the Lambda function"
  type        = string
}

variable "source_file" {
  description = "The path to the deployment package for the Lambda function"
  type        = string
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket to which the Lambda function will write"
  type        = string
}
