### File: locals.tf ###
locals {
  location = "eastus"
  tags = {
    owner       = "elomidlleware"
    environment = terraform.workspace
  }
  project_name = {
    name = "elomidlleware"
  }
}


### File: provider.tf ###
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


### File: resource_group.tf ###
resource "azurerm_resource_group" "elomidlleware_assist_resource_group" {
  name     = "${terraform.workspace}-${local.project_name.name}-rg"
  location = local.location
  tags     = local.tags
}

output "resource_group_name" {
  value = azurerm_resource_group.elomidlleware_assist_resource_group.name
}

output "resource_group_location" {
  value = azurerm_resource_group.elomidlleware_assist_resource_group.location
}


