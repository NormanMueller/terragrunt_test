include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/iam_role"
}

dependency "policy" {
  config_path = "../../iam_policy/lambda_policy"
}

inputs = {
  role_name = "rolle"
  policy_document = [{
    Effect = "Allow"
    Action = ["sts:AssumeRole"]
    Principal : {
      "Service" : "lambda.amazonaws.com"
    },
    }
  ]
  list_policys = [dependency.policy.outputs.arn]
}