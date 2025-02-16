resource "azurerm_virtual_network" "vnet1" {
  name                = "vnet1"
  address_space       = ["192.168.0.0/16"]
  location            = "eastus"
  resource_group_name = azurerm_resource_group.rg1.name
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["192.168.1.0/24"]
}

#-------------------------------------------------------------------------------------------------

resource "azurerm_virtual_network" "vnet2" {
  name                = "vnet2"
  address_space       = ["10.0.0.0/16"]
  location            = "westus"
  resource_group_name = azurerm_resource_group.rg1.name
}

resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vnet2.name
  address_prefixes     = ["10.0.1.0/24"]
}

#-------------------------------------------------------------------------------------------------

resource "azurerm_virtual_network" "vnet3" {
  name                = "vnet3"
  address_space       = ["100.1.0.0/16"]
  location            = "centralus"
  resource_group_name = azurerm_resource_group.rg1.name
}

resource "azurerm_subnet" "subnet3" {
  name                 = "subnet3"
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vnet3.name
  address_prefixes     = ["100.1.0.0/24"]
}
