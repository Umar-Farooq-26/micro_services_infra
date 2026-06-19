resource "azurerm_kubernetes_cluster" "aks" {
 name                = var.aks_name
  resource_group_name = var.resource_group_name
  location            = var.location
  dns_prefix          = var.dns_prefix

  # Use system-assigned identity for simplicity; swap to UserAssigned for strict least-privilege
  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name           = var.node_pool_name
    node_count     = var.node_count
    vm_size        = var.vm_size
    vnet_subnet_id = var.vnet_subnet_id

    upgrade_settings {
      max_surge = "10%"
    }
  }

  # Enable OIDC + Workload Identity for pod-level Azure auth (no secrets in pods)
  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  # Azure CNI for full VNet integration
  network_profile {
    network_plugin    = "azure"
    network_policy    = "azure"
    load_balancer_sku = "standard"
    service_cidr      = var.service_cidr
    dns_service_ip    = cidrhost(var.service_cidr, 10)
  }

  # Container Insights via Log Analytics
  oms_agent {
    log_analytics_workspace_id = var.log_analytics_id
  }

  # Azure AD RBAC integration
  azure_active_directory_role_based_access_control {
    azure_rbac_enabled = true
    tenant_id          = var.tenant_id
  }

  # Automatic minor version upgrades
  automatic_upgrade_channel = "patch"

  tags = var.tags
}