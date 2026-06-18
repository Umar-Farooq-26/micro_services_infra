resource "azurerm_container_registry" "acr" {
  for_each = var.acr

  name                = each.value.acr_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.acr_location
  sku                 = each.value.acr_sku
  admin_enabled       = false

}