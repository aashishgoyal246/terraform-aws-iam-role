# Module      : IAM Role
# Description : Terraform module to create IAM Role resource on AWS.
output "arn" {
  value       = module.iam_role.arn
  description = "The Amazon Resource Name (ARN) specifying the role."
}

output "name" {
  value       = module.iam_role.name
  description = "Name of specifying the role."
}

output "tags" {
  value       = module.iam_role.tags
  description = "A mapping of tags to assign to the resource."
}