provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}

module "dynamodb" {
  source     = "./modules/dynamodb"
  table_name = var.table_name
}

module "lambda" {
  source        = "./modules/lambda"
  lambda_name   = var.lambda_name
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime
}

module "api_gateway" {
  source     = "./modules/api_gateway"
  lambda_arn = module.lambda.lambda_arn
}

module "cognito" {
  source = "./modules/cognito"
}

module "observability" {
  source      = "./modules/observability"
  lambda_name = var.lambda_name
}
