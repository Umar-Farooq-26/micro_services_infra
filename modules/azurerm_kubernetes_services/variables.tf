variable "aks_name" {
  description = "Name of the AKS cluster"
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

variable "dns_prefix" {
  description = "DNS prefix for the cluster"
  type        = string
}

variable "node_pool_name" {
  description = "Name of the default node pool"
  type        = string
  default     = "default"
}

variable "node_count" {
  description = "Number of nodes in the default pool"
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "VM size for nodes"
  type        = string
  default     = "Standard_B2ls_v2"
}

variable "vnet_subnet_id" {
  description = "Subnet ID for AKS nodes (Azure CNI)"
  type        = string
}

variable "log_analytics_id" {
  description = "Log Analytics workspace resource ID for Container Insights"
  type        = string
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}

variable "tenant_id" {
  description = "Azure AD tenant ID for AKS AAD integration"
  type        = string
}

variable "service_cidr" {
  description = "Service CIDR for AKS cluster (must not overlap your VNet/subnets)"
  type        = string
  default     = "10.244.0.0/16"
}
