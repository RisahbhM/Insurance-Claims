resource "aws_dynamodb_table" "table" {
  name           = var.table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "record_id"

  attribute {
    name = "record_id"
    type = "S"
  }

  tags = {
    Project = "GenAI-Medical-Coding"
  }
}

output "table_name" {
  value = aws_dynamodb_table.table.name
}

