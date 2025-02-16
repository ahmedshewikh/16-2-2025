
#---------------------Windows-machines in vnet2---------------------------------------

resource "azurerm_public_ip" "win-vm-1-pip" {
  name                = "win-vm-1-pip"
  location            = azurerm_virtual_network.vnet2.location
  resource_group_name = azurerm_resource_group.rg1.name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "win-vm1-nic" {
  name                = "win-vm1-nic"
  location            = azurerm_virtual_network.vnet2.location
  resource_group_name = azurerm_resource_group.rg1.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet2.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.win-vm-1-pip.id
    
  }
}


resource "azurerm_windows_virtual_machine" "win-vm-1" {
  name                  = "win-vm-1"
  resource_group_name   = azurerm_resource_group.rg1.name
  location              = azurerm_virtual_network.vnet2.location
  size                  = "Standard_D1_v2" 
  admin_username        = "adminserver"
  admin_password        = "P@$$wordfortest"

  network_interface_ids = [azurerm_network_interface.win-vm1-nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }

  identity {
    type = "SystemAssigned"
  }
}



#---------3----Linux-----on each vnet--------------------------------------------------------


resource "azurerm_public_ip" "linux-vm-1-pip" {
  name                = "linux-vm-1-pip"
  location            = azurerm_virtual_network.vnet1.location
  resource_group_name = azurerm_resource_group.rg1.name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "linux-vm-1-nic" {
  name                = "linux-vm-1-nic"
  location            = azurerm_virtual_network.vnet1.location
  resource_group_name = azurerm_resource_group.rg1.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.linux-vm-1-pip.id
    
  }
}


resource "azurerm_linux_virtual_machine" "linux-vm-1" {
  name                = "linux-vm-1"
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_virtual_network.vnet1.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  admin_password      = "P@$$wordfortest"
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.linux-vm-1-nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}




resource "azurerm_public_ip" "linux-vm-2-pip" {
  name                = "linux-vm-2-pip"
  location            = azurerm_virtual_network.vnet3.location
  resource_group_name = azurerm_resource_group.rg1.name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "linux-vm-2-nic" {
  name                = "linux-vm-2-nic"
  location            = azurerm_virtual_network.vnet3.location
  resource_group_name = azurerm_resource_group.rg1.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet3.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.linux-vm-2-pip.id
    
  }
}


resource "azurerm_linux_virtual_machine" "linux-vm-2" {
  name                = "linux-vm-2"
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_virtual_network.vnet3.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  admin_password      = "P@$$wordfortest"
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.linux-vm-2-nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}