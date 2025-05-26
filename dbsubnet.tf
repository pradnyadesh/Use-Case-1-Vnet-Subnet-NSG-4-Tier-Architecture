#DBsubnet 
resource "azurerm_subnet" "dbsubnet" {
  name = "${var.vnetname}-${var.dbsubnet_name}"
  virtual_network_name = var.vnetname
  resource_group_name = var.ResourceGroup
  address_prefixes = var.dbsubnet_addressprefix
  depends_on = [ azurerm_virtual_network.vnet ]
}

#dbsubnet NSG
resource "azurerm_network_security_group" "dbsubnet_NSG" {
  resource_group_name = var.ResourceGroup
  location = var.ResouceLocation
  name = azurerm_subnet.dbsubnet.name
  depends_on = [ azurerm_subnet.dbsubnet ]
}

#dbsubnet NSG rule 

resource "azurerm_network_security_rule" "dbsubnet_rule" {
  for_each = local.security_rule_ports
  resource_group_name = var.ResourceGroup
  network_security_group_name = azurerm_network_security_group.dbsubnet_NSG.name
  name = "websubnet_rule_${each.value}"
  priority = each.key
  protocol = "Tcp"
  direction = "Inbound"
  access = "Allow"
  destination_port_range = each.value
}

resource "azurerm_subnet_network_security_group_association" "associtedbsubnetnsg" {
  subnet_id = azurerm_subnet.dbsubnet.id
  network_security_group_id = azurerm_network_security_group.dbsubnet_NSG.id
  depends_on = [ azurerm_network_security_group.dbsubnet_NSG]
}
