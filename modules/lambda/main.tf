# IAM Role for Lambda Execution
resource "aws_iam_role" "lambda_exec" {
  name = "${var.lambda_name}-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

# Attach Bedrock access permissions
resource "aws_iam_role_policy" "lambda_bedrock_policy" {
  name = "bedrock-access"
  role = aws_iam_role.lambda_exec.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "bedrock:InvokeModel",
          "bedrock:InvokeModelWithResponseStream"
        ],
        Resource = "*"
      }
    ]
  })
}

# Lambda Function Definition
resource "aws_lambda_function" "lambda_fn" {
  function_name    = var.lambda_name
  runtime          = var.runtime
  handler          = var.handler
  role             = aws_iam_role.lambda_exec.arn

  filename         = "${path.module}/../../lambda_function_payload.zip"
  source_code_hash = filebase64sha256("${path.module}/../../lambda_function_payload.zip")
}

# Outputs to share Lambda ARN
output "lambda_arn" {
  value = aws_lambda_function.lambda_fn.arn
}
