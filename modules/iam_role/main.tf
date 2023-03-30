resource "aws_iam_role" "lambda_role" {
  name               = var.role_name
  assume_role_policy =   jsonencode({
    Version = "2012-10-17"
    Statement = var.policy_document
  })
  managed_policy_arns = var.list_policys
}