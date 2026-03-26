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