terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "elomiddleware-terraform"
    storage_account_name = "testelohubtf"
    container_name       = "terraformstate"
    key                  = "terraform.tfstate"
  }
}
