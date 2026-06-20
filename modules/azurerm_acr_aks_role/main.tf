resource "azurerm_role_assignment" "acr_pull" {
  count                            = var.create_role_assignment ? 1 : 0
  principal_id                     = var.aks_kubelet_identity_object_id
  role_definition_name             = "AcrPull"
  scope                            = var.acr_id
  skip_service_principal_aad_check = true
}
