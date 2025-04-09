resource "aws_cognito_user_pool" "users" {
  name = "medical-coding-user-pool"
}

resource "aws_cognito_user_pool_client" "users_client" {
  name         = "medical-coding-client"
  user_pool_id = aws_cognito_user_pool.users.id
}

output "user_pool_id" {
  value = aws_cognito_user_pool.users.id
}

