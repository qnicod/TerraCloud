provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "existing_rg" {
  name = "t-clo-901-rns-1"
}

data "azurerm_dev_test_lab" "existing_lab" {
  name                = "t-clo-901-rns-1"
  resource_group_name = data.azurerm_resource_group.existing_rg.name
}

# Data source pour récupérer le Virtual Network existant
data "azurerm_virtual_network" "existing_vnet" {
  name                = "t-clo-901-rns-1"
  resource_group_name = data.azurerm_resource_group.existing_rg.name
}

data "azurerm_subnet" "existing_subnet" {
  name                 = "t-clo-901-rns-1Subnet"
  virtual_network_name = data.azurerm_virtual_network.existing_vnet.name
  resource_group_name  = data.azurerm_resource_group.existing_rg.name
}

resource "azurerm_dev_test_lab_vm" "example_vm" {
  name                = "terra-cloud-application-vm"
  resource_group_name = data.azurerm_resource_group.existing_rg.name
  lab_name            = data.azurerm_dev_test_lab.existing_lab.name
  location            = data.azurerm_resource_group.existing_rg.location

  size                = "Standard_A4_v2"
  admin_username      = "maintener"
  admin_password      = "Password1234!"

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "22.04-LTS"
    version   = "latest"
  }

  subnet_id = data.azurerm_subnet.existing_subnet.id

  output "public_ip" {
    value = azurerm_dev_test_lab_vm.example_vm.public_ip_address
  }
}

