variable "aws_region" {
  default = "us-east-1"
}

variable "bucket_name" {
  default = "genai-medical-coding-051826693353" # ✅ Unique S3 bucket name
}

variable "table_name" {
  default = "icd10_code_logs"
}

variable "lambda_name" {
  default = "medical-coding-processor"
}

variable "lambda_handler" {
  default = "lambda_function.lambda_handler"
}

variable "lambda_runtime" {
  default = "python3.11"
}
