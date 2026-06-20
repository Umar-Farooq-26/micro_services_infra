variable "key_vault_name" {
  description = "Name of the Key Vault (must be globally unique)"
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

variable "sku_name" {
  description = "SKU: standard or premium"
  type        = string
  default     = "standard"
}

variable "tenant_id" {
  description = "Azure AD tenant ID"
  type        = string
}

variable "create_role_assignment" {
  description = "Whether to create the Key Vault Administrator role assignment for the deploying principal"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}
