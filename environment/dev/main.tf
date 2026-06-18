module "resource_group" {
  source          = "../../modules/resource_group"
  
  resource_groups = var.resource_groups_dev
}

module "acr" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_container_registry"

  acr = var.dev_acr
}

module "kubernetes_cluster" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_kubernetes_services"

  AKS = var.dev_aks
}