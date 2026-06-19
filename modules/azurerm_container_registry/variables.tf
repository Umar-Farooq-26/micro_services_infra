variable "acr_name" {
  description = "Name of the Container Registry (globally unique, alphanumeric)"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "acr_location" {
  description = "Azure region"
  type        = string
}

variable "acr_sku" {
  description = "SKU: Basic, Standard, or Premium"
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.acr_sku)
    error_message = "ACR SKU must be Basic, Standard, or Premium."
  }
}

variable "georeplications" {
  description = "Geo-replication locations (Premium SKU only)"
  type = list(object({
    location                = string
    zone_redundancy_enabled = bool
  }))
  default = []
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}
