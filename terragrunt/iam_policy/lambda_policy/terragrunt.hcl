include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/iam_policy"
}
inputs = {
  iam_name = "iam_name"
  iam_policy = [
    {
      Action   = ["dynamodb:List*",
                "dynamodb:*",
                "dynamodb:DescribeReservedCapacity*",
                "dynamodb:DescribeLimits",
                "dynamodb:DescribeTimeToLive"]
      Effect   = "Allow"
      Resource = "*"
    }
  ]
}