terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }

  # backend "azurerm" {
  #   resource_group_name  = "rg-tfstate-dev"
  #   storage_account_name = "sttfstatedev001"
  #   container_name       = "tfstate"
  #   key                  = "dev.terraform.tfstate"
  # }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = false
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
}

provider "azuread" {}

provider "kubernetes" {
  host                   = module.aks["aks1"].kube_config.host
  client_certificate     = base64decode(module.aks["aks1"].kube_config.client_certificate)
  client_key             = base64decode(module.aks["aks1"].kube_config.client_key)
  cluster_ca_certificate = base64decode(module.aks["aks1"].kube_config.cluster_ca_certificate)
}
