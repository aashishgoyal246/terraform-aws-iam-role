provider "aws" {
  region = "ap-south-1"
}

module "iam_role" {
  source = "../"

  name        = "iam-role"
  application = "aashish"
  environment = "test"
  label_order = ["environment", "application", "name"]

  enabled            = true
  assume_role_policy = data.aws_iam_policy_document.default.json
  policy_enabled     = true
  policy             = data.aws_iam_policy_document.iam_policy.json
}

data "aws_iam_policy_document" "default" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "iam_policy" {
  statement {
    actions = [
      "s3:*"
    ]
    effect    = "Allow"
    resources = ["*"]
  }
}