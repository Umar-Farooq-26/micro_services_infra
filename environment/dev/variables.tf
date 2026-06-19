variable "resource_groups_dev" {
  description = "Map of resource groups to create"
  type = map(object({
    name     = string
    location = string
  }))
}

variable "dev_vnet" {
  description = "Map of virtual networks to create"
  type = map(object({
    vnet_name           = string
    resource_group_name = string
    location            = string
    address_space       = list(string)
    subnets = map(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}

variable "dev_log_analytics" {
  description = "Map of Log Analytics workspaces"
  type = map(object({
    workspace_name      = string
    resource_group_name = string
    location            = string
    sku                 = string
    retention_in_days   = number
  }))
}

variable "dev_key_vault" {
  description = "Map of Key Vaults"
  type = map(object({
    key_vault_name      = string
    resource_group_name = string
    location            = string
    sku_name            = string
    tenant_id           = string
  }))
}

variable "dev_acr" {
  description = "Map of Azure Container Registries"
  type = map(object({
    acr_name            = string
    resource_group_name = string
    acr_location        = string
    acr_sku             = string
  }))
}

variable "dev_aks" {
  description = "Map of AKS clusters"
  type = map(object({
    aks_name            = string
    resource_group_name = string
    location            = string
    dns_prefix          = string
    node_pool_name      = string
    node_count          = number
    vm_size             = string
    tenant_id           = string
  }))
}
