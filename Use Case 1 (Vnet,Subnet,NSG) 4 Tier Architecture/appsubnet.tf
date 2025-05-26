resource "azurerm_subnet" "subnet" {
  name = var.subnet_name[1]
  virtual_network_name = var.vnetname
  resource_group_name = var.ResourceGroup
  address_prefixes =var.subnet_addressprefix[1]
  depends_on = [azurerm_virtual_network.vnet]
  
}

