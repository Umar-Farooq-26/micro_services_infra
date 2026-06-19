resource_groups_dev = {
  rg1 = {
    name     = "rg-aks-dev-01"
    location = "australiaeast"
  }
}

dev_vnet = {
  vnet1 = {
    vnet_name           = "vnet-aks-dev-01"
    resource_group_name = "rg-aks-dev-01"
    location            = "australiaeast"
    address_space       = ["10.0.0.0/16"]
    subnets = {
      aks-subnet = {
        name             = "snet-aks-dev-01"
        address_prefixes = ["10.0.1.0/24"]
      }
      appgw-subnet = {
        name             = "snet-appgw-dev-01"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  }
}

dev_log_analytics = {
  law1 = {
    workspace_name      = "law-aks-dev-01"
    resource_group_name = "rg-aks-dev-01"
    location            = "australiaeast"
    sku                 = "PerGB2018"
    retention_in_days   = 30
  }
}

dev_key_vault = {
  kv1 = {
    key_vault_name      = "kv-aks-dev-00001"
    resource_group_name = "rg-aks-dev-01"
    location            = "australiaeast"
    sku_name            = "standard"
    tenant_id           = "33da77e3-b6af-4f43-b5cb-5ffdb75f04d1" # Replace with your Azure Tenant ID
  }
}

dev_acr = {
  acr1 = {
    acr_name            = "acrdev00001"
    resource_group_name = "rg-aks-dev-01"
    acr_location        = "australiaeast"
    acr_sku             = "Standard"
  }
}

dev_aks = {
  aks1 = {
    aks_name            = "aks-dev-01"
    resource_group_name = "rg-aks-dev-01"
    location            = "australiaeast"
    dns_prefix          = "aksdev01"
    node_pool_name      = "default"
    node_count          = 2
    vm_size             = "Standard_B2ls_v2"
    tenant_id           = "33da77e3-b6af-4f43-b5cb-5ffdb75f04d1"
  }
}
