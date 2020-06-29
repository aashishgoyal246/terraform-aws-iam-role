#Module      : LABELS
#Description : Terraform label module variables.
variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "application" {
  type        = string
  default     = ""
  description = "Application (e.g. `cd` or `clouddrove`)."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "enabled" {
  type        = bool
  default     = false
  description = "Flag to control the vpc creation."
}

variable "label_order" {
  type        = list
  default     = []
  description = "Label order, e.g. `name`,`application`."
}

variable "tags" {
  type        = map
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)."
}

# Module      : IAM Role
# Description : Terraform IAM Role module variables.
variable "assume_role_policy" {
  type        = any
  default     = null
  description = "Whether to create IAM role."
}

variable "force_detach_policies" {
  type        = bool
  default     = false
  description = "The policy that grants an entity permission to assume the role."
}

variable "path" {
  type        = string
  default     = "/"
  description = "The path to the role."
}

variable "description" {
  type        = string
  default     = ""
  description = "The description of the role."
}

variable "max_session_duration" {
  type        = number
  default     = 3600
  description = "The maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours."
}

variable "permissions_boundary" {
  type        = string
  default     = ""
  description = "The ARN of the policy that is used to set the permissions boundary for the role."
}

variable "policy" {
  type        = any
  default     = null
  description = "The policy document."
}

variable "policy_enabled" {
  type        = bool
  default     = false
  description = "Whether to Attach IAM policy with role."
}

variable "policy_arn" {
  type        = string
  default     = ""
  description = "The ARN of the policy you want to apply."
}