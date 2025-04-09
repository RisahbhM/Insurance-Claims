output "api_gateway_url" {
  value = module.api_gateway.api_url
}

output "s3_bucket_name" {
  value = module.s3.bucket_name
}

output "dynamodb_table" {
  value = module.dynamodb.table_name
}
