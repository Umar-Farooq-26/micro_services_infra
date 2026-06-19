variable "workspace_name" {
  description = "Name of the Log Analytics workspace"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "sku" {
  description = "Pricing SKU"
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "Data retention period in days"
  type        = number
  default     = 30
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}
