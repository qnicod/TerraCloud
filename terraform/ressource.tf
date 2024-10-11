resource "azurerm_linux_virtual_machine" "example_vm" {
  name                = "terra-cloud-application-vm"
  resource_group_name = data.azurerm_resource_group.existing_rg.name
  location            = data.azurerm_resource_group.existing_rg.location

  size                = "Standard_A4_v2"
  admin_username      = "maintener"
  admin_password      = "Password1234!"

  network_interface_ids = [azurerm_network_interface.example_nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "22.04-LTS"
    version   = "latest"
  }
}

# Outputs should be placed here at the module level
output "public_ip" {
  value = azurerm_public_ip.example_public_ip.ip_address
}

