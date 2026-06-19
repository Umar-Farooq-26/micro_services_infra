resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.acr_location
  sku                 = var.acr_sku
  admin_enabled       = false

  # Geo-replication only available on Premium SKU
  dynamic "georeplications" {
    for_each = var.acr_sku == "Premium" ? var.georeplications : []
    content {
      location                = georeplications.value.location
      zone_redundancy_enabled = georeplications.value.zone_redundancy_enabled
    }
  }

  tags = var.tags
}