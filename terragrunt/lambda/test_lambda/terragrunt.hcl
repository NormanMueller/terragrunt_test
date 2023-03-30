include "root" {
  path   = find_in_parent_folders()
  expose = true
}

dependency "role" {
  config_path = "../../iam_role/lambda_role"
}

terraform {
  source = "../../../modules/lambda"
}
inputs = {
  lambda_name       = "test-lambda"
  source_file       = "${get_parent_terragrunt_dir()}/lambda_code/src/main.py"
  output_path       = "main.zip"
  lambda_role       = dependency.role.outputs.arn
  my_python_version = "python3.9"
}