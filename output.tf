output "vnet_name" {
  description = "Virtual network name"
  value = azurerm_virtual_network.vnet.name
}

output "vnet_id" {
  description = "vnet ID"
  value = azurerm_virtual_network.vnet.id
}

output "websubnetname" {
  description = "websubnetname"
  value = azurerm_subnet.websubnet.name
}

output "websubnetID" {
  value = azurerm_subnet.websubnet.id
}
