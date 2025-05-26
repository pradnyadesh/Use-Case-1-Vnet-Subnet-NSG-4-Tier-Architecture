#websubnet 
resource "azurerm_subnet" "subnet" {
  name = var.subnet_name[0]
  virtual_network_name = var.vnetname
  resource_group_name = var.ResourceGroup
  address_prefixes = var.subnet_addressprefix[0]
  depends_on = [ azurerm_virtual_network.vnet ]
}

#websubnet NSG

resource "azurerm_network_security_group" "NSG" {
  resource_group_name = var.ResourceGroup
  location = var.ResouceLocation
  name = "azurerm_subnet.subnet[0]-NSG"
}

