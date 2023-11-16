# Terraform Registry Example
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine

resource "azurerm_linux_virtual_machine" "example_linux_virtual_machine" {
  name                = "example-linux-virtual-machine"
  admin_username      = "adminuser"
  location            = azurerm_resource_group.example_resource_group_for_instance.location
  network_interface_ids = [
    azurerm_network_interface.example_network_interface.id,
  ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  resource_group_name = azurerm_resource_group.example_resource_group_for_instance.name
  size                = "Standard_F2"
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

resource "azurerm_resource_group" "example_resource_group_for_instance" {
  name     = "example-resource-group"
  location = "West US 2"
}

resource "azurerm_virtual_network" "example_virtual_network" {
  name                = "example-virtual-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example_resource_group_for_instance.location
  resource_group_name = azurerm_resource_group.example_resource_group_for_instance.name
}

resource "azurerm_subnet" "example_subnet" {
  name                 = "example-subnet"
  resource_group_name  = azurerm_resource_group.example_resource_group_for_instance.name
  virtual_network_name = azurerm_virtual_network.example_virtual_network.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "example_network_interface" {
  name                = "example-network-interface"
  location            = azurerm_resource_group.example_resource_group_for_instance.location
  resource_group_name = azurerm_resource_group.example_resource_group_for_instance.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

