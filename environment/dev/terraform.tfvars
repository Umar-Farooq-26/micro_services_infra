resource_groups_dev = {
  rg1 = {
    name     = "rg-aks-dev-01"
    location = "australiaeast"
  }
}

dev_acr = {
  acr1 = {
    acr_name            = "acrdev00001"
    resource_group_name = "rg-aks-dev-01"
    acr_location        = "australiaeast"
    acr_sku             = "Basic"
  }
}

dev_aks = {
  aks1 = {
    aks_name            = "aks-dev-01"
    resource_group_name = "rg-aks-dev-01"
    location            = "australiaeast"
    dns_prefix         = "aksdev01"
    node_pool_name     = "default"
    node_count         = 2
    vm_size            = "Standard_B2ls_v2"
  }
}