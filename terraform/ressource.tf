resource "azurerm_dev_test_linux_virtual_machine" "example" {
  name                   = "terra-cloud-application-vm-example"
  resource_group_name    = data.azurerm_resource_group.existing_rg.name
  lab_name               = data.azurerm_dev_test_lab.existing_lab.name
  location               = data.azurerm_resource_group.existing_rg.location
  size                   = "Standard_A4_v2"
  username               = "maintainer"
  password               = "Password1234!"
  lab_virtual_network_id = data.azurerm_dev_test_virtual_network.existing_vnet.id
  lab_subnet_name        = data.azurerm_dev_test_virtual_network.existing_vnet.allowed_subnets[0].lab_subnet_name
  storage_type           = "Premium"
  notes                  = "Application VM for the Terraform Cloud example."

  gallery_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
