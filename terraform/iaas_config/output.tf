output "lab_subnet_name" {
  value = data.azurerm_dev_test_virtual_network.existing_vnet.allowed_subnets[0].lab_subnet_name
}

output "vnet_name" {
  value = data.azurerm_dev_test_virtual_network.existing_vnet.name
}