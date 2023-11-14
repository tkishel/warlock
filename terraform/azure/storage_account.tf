resource "azurerm_resource_group" "example_azurerm_resource_group" {
  name     = "example-azurerm-resource-group"
  location = "West Europe"
}

resource "azurerm_storage_account" "az_example_storage_account" {
  name                     = "azexamplestorageaccount"
  resource_group_name      = azurerm_resource_group.example_azurerm_resource_group.name
  location                 = azurerm_resource_group.example_azurerm_resource_group.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}