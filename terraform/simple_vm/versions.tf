terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.92.0"
    }
  }
  required_version = "~> 1.1.0"
}

provider "azurerm" {
  features {}
}
