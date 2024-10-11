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

data "azurerm_dev_test_virtual_network" "existing_vnet" {
  name                = "t-clo-901-rns-1"
  lab_name            = azurerm_dev_test_lab.existing_lab.name
  resource_group_name = azurerm_resource_group.existing_rg.name

  subnet {
    use_public_ip_address           = "Allow"
    use_in_virtual_machine_creation = "Allow"
  }
}
