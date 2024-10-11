resource "azurerm_dev_test_linux_virtual_machine" "example_vm" {
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

  network_interface_ids = [azurerm_network_interface.example_nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}

resource "azurerm_network_interface" "example_nic" {
  name                = "terra-cloud-nic"
  location            = data.azurerm_resource_group.existing_rg.location
  resource_group_name = data.azurerm_resource_group.existing_rg.name

  ip_configuration {
    name                          = "terra-cloud-ip-config"
    subnet_id                    = data.azurerm_subnet.existing_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

