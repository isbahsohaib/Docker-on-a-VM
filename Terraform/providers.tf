terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
  }
}

provider "azurerm" {
  features {}
  # depending on who is hosting the virtual machine. this is kelly's subscription id.
  subscription_id = "c0035358-9776-4fa3-ac05-e92b995d067b"
}