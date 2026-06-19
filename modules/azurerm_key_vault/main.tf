data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "this" {
  name                        = var.key_vault_name
  resource_group_name         = var.resource_group_name
  location                    = var.location
  sku_name                    = var.sku_name
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false # Set true for production
  rbac_authorization_enabled = true
  tags                        = var.tags 
}  
 
# Grant the deploying principal Key Vault Administrator
resource "azurerm_role_assignment" "kv_admin" {
  scope                = azurerm_key_vault.this.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id
}
