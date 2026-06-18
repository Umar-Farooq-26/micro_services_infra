terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.77.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "55e255f2-e37a-47b4-bdc9-8d1f4a8d391c"
}