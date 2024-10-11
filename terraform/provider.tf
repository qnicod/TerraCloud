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

data "azurerm_virtual_network" "existing_vnet" {
  name                = "t-clo-901-rns-1"
  resource_group_name = data.azurerm_resource_group.existing_rg.name
}

data "azurerm_subnet" "existing_subnet" {
  name                 = "t-clo-901-rns-1Subnet"
  virtual_network_name = data.azurerm_virtual_network.existing_vnet.name
  resource_group_name  = data.azurerm_resource_group.existing_rg.name
}
