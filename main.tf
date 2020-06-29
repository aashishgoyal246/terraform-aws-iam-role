#Module      : LABELS
#Description : This terraform module is designed to generate consistent label names and tags
#              for resources. You can use terraform-labels to implement a strict naming
#              convention.
module "labels" {
  source = "git::https://github.com/aashishgoyal246/terraform-labels.git?ref=tags/0.12.0"

  name        = var.name
  application = var.application
  environment = var.environment
  enabled     = var.enabled
  label_order = var.label_order
  tags        = var.tags
}

# Module      : IAM Role
# Description : Terraform module to create IAM role resource on AWS.
resource "aws_iam_role" "default" {
  count                 = var.enabled ? 1 : 0
  name                  = module.labels.id
  assume_role_policy    = var.assume_role_policy
  force_detach_policies = var.force_detach_policies
  path                  = var.path
  description           = var.description
  max_session_duration  = var.max_session_duration
  permissions_boundary  = var.permissions_boundary
  tags                  = module.labels.tags
}

# Module      : IAM Role Policy
# Description : Terraform module to create IAM role policy resource on AWS to attach with IAM Role.
resource "aws_iam_role_policy" "default" {
  count  = var.enabled && var.policy_enabled && var.policy_arn == "" ? 1 : 0
  name   = format("%s-policy", module.labels.id)
  role   = join("", aws_iam_role.default.*.id)
  policy = var.policy
}

# Module      : IAM Role Policy Attachment
# Description : Terraform module to create IAM role policy resource on AWS to attach with IAM Role.
resource "aws_iam_role_policy_attachment" "default" {
  count      = var.enabled && var.policy_enabled && var.policy_arn != "" ? 1 : 0
  role       = join("", aws_iam_role.default.*.id)
  policy_arn = var.policy_arn
}