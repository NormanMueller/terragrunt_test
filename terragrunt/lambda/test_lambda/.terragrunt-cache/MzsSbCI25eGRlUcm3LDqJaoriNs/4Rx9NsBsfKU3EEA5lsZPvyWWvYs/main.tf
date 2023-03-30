data "archive_file" "archive_file_lambda" {
  type        = "zip"
  source_file = var.source_file
  output_path = var.output_path
}


resource "aws_lambda_function" "lambda" {
  function_name    = var.lambda_name
  filename         = data.archive_file.archive_file_lambda.output_path
  source_code_hash = data.archive_file.archive_file_lambda.output_base64sha256
  role             = var.lambda_role
  runtime          = var.my_python_version
  handler          = "main.lambda_handler"
  timeout          = 10
}
