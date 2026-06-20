# ─────────────────────────────────────────────
# Resource Groups
# ─────────────────────────────────────────────
module "resource_group" {
  source   = "../../modules/resource_group"
  for_each = var.resource_groups_dev

  name     = each.value.name
  location = each.value.location
  tags     = local.common_tags
}

# ─────────────────────────────────────────────
# Virtual Network
# ─────────────────────────────────────────────
module "vnet" {
  source   = "../../modules/azurerm_virtual_network"
  for_each = var.dev_vnet

  vnet_name           = each.value.vnet_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  address_space       = each.value.address_space
  subnets             = each.value.subnets
  tags                = local.common_tags

  depends_on = [module.resource_group]
}

# ─────────────────────────────────────────────
# Log Analytics Workspace
# ─────────────────────────────────────────────
module "log_analytics" {
  source   = "../../modules/azurerm_log_analytics"
  for_each = var.dev_log_analytics

  workspace_name      = each.value.workspace_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = each.value.sku
  retention_in_days   = each.value.retention_in_days
  tags                = local.common_tags

  depends_on = [module.resource_group]
}

# ─────────────────────────────────────────────
# Key Vault
# ─────────────────────────────────────────────
module "key_vault" {
  source   = "../../modules/azurerm_key_vault"
  for_each = var.dev_key_vault

  key_vault_name      = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku_name            = each.value.sku_name
  tenant_id           = each.value.tenant_id
  tags                = local.common_tags

  depends_on = [module.resource_group]
}

# ─────────────────────────────────────────────
# Container Registry
# ─────────────────────────────────────────────
module "acr" {
  source   = "../../modules/azurerm_container_registry"
  for_each = var.dev_acr

  acr_name            = each.value.acr_name
  resource_group_name = each.value.resource_group_name
  acr_location        = each.value.acr_location
  acr_sku             = each.value.acr_sku
  tags                = local.common_tags

  depends_on = [module.resource_group]
}

# ─────────────────────────────────────────────
# AKS Cluster
# ─────────────────────────────────────────────
module "aks" {
  source   = "../../modules/azurerm_kubernetes_services"
  for_each = var.dev_aks

  aks_name            = each.value.aks_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  dns_prefix          = each.value.dns_prefix
  node_pool_name      = each.value.node_pool_name
  node_count          = each.value.node_count
  vm_size             = each.value.vm_size
  vnet_subnet_id      = module.vnet["vnet1"].subnet_ids["aks-subnet"]
  log_analytics_id    = module.log_analytics["law1"].workspace_id
  tags                = local.common_tags

  tenant_id = each.value.tenant_id

  depends_on = [module.vnet, module.log_analytics]
}

# ─────────────────────────────────────────────
# ACR → AKS Role Assignment (AcrPull)
# ─────────────────────────────────────────────
module "acr_aks_role" {
  source   = "../../modules/azurerm_acr_aks_role"
  for_each = var.dev_acr

  acr_id                         = module.acr[each.key].acr_id
  aks_kubelet_identity_object_id = module.aks["aks1"].kubelet_identity_object_id

  depends_on = [module.acr, module.aks]
}
