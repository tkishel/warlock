# Terraform Registry Example

resource "azurerm_resource_group" "example_resource_group_sa" {
  name     = "example-resource-group-sa"
  location = "West US 2"
}

resource "azurerm_storage_account" "az_example_storage_account" {
  name                     = "azexamplestorageaccount"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  location                 = azurerm_resource_group.example_resource_group_sa.location
  resource_group_name      = azurerm_resource_group.example_resource_group_sa.name
}