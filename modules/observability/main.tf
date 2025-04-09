resource "aws_cloudwatch_log_group" "lambda_log" {
  name              = "/aws/lambda/${var.lambda_name}"
  retention_in_days = 14
}

resource "aws_xray_group" "xray_group" {
  group_name = "MedicalCodingXRay"
  filter_expression = "service(\"${var.lambda_name}\")"
}
