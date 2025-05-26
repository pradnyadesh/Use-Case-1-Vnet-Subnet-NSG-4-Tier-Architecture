#websubnet 
resource "azurerm_subnet" "websubnet" {
  name = "${var.vnetname}-${var.websubnet_name}"
  virtual_network_name = var.vnetname
  resource_group_name = var.ResourceGroup
  address_prefixes = var.websubnet_addressprefix
  depends_on = [ azurerm_virtual_network.vnet ]
}

#websubnet NSG
resource "azurerm_network_security_group" "websubnet_NSG" {
  resource_group_name = var.ResourceGroup
  location = var.ResouceLocation
  name = azurerm_subnet.websubnet.name
  depends_on = [ azurerm_subnet.websubnet ]
}

#websubnet NSG rule 

resource "azurerm_network_security_rule" "websubnet_rule" {
  for_each = local.security_rule_ports
  resource_group_name = var.ResourceGroup
  network_security_group_name = azurerm_network_security_group.websubnet_NSG.name
  name = "websubnet_rule_${each.value}"
  priority = each.key
  protocol = "Tcp"
  direction = "Inbound"
  access = "Allow"
  destination_port_range = each.value
}

resource "azurerm_subnet_network_security_group_association" "associtewebsubnetnsg" {
  subnet_id = azurerm_subnet.websubnet.id
  network_security_group_id = azurerm_network_security_group.websubnet_NSG.id
  depends_on = [ azurerm_network_security_group.websubnet_NSG]
}
