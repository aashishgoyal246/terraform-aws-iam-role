# Module      : IAM Role
# Description : Terraform module to create IAM Role resource on AWS.
output "arn" {
  value       = join("", aws_iam_role.default.*.arn)
  description = "The Amazon Resource Name (ARN) specifying the role."
}

output "name" {
  value       = join("", aws_iam_role.default.*.name)
  description = "Name of specifying the role."
}

output "tags" {
  value       = module.labels.tags
  description = "A mapping of tags to assign to the resource."
}