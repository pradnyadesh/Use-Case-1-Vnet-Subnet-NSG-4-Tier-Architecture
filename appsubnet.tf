#appsubnet 
resource "azurerm_subnet" "appsubnet" {
  name = "${var.vnetname}-${var.appsubnet_name}"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name = azurerm_resource_group.RG.name
  address_prefixes = var.appsubnet_addressprefix
  depends_on = [ azurerm_virtual_network.vnet ]
}

#appsubnet NSG
resource "azurerm_network_security_group" "appsubnet_NSG" {
  resource_group_name = azurerm_resource_group.RG.name
  location = var.ResouceLocation
  name = azurerm_subnet.appsubnet.name
  depends_on = [ azurerm_subnet.appsubnet ]
}

#appsubnet NSG rule 

resource "azurerm_network_security_rule" "appsubnet_rule" {
  for_each = local.security_rule_ports
  resource_group_name = azurerm_resource_group.RG.name
  network_security_group_name = azurerm_network_security_group.appsubnet_NSG.name
  name = "appsubnet_rule_${each.value}"
  priority = each.key
  protocol = "Tcp"
  direction = "Inbound"
  access = "Allow"
  source_port_range = "*"
  source_address_prefix  = "*"
  destination_address_prefix = "*"
  destination_port_range = each.value
}

resource "azurerm_subnet_network_security_group_association" "associteappsubnetnsg" {
  subnet_id = azurerm_subnet.appsubnet.id
  network_security_group_id = azurerm_network_security_group.appsubnet_NSG.id
  depends_on = [ azurerm_network_security_group.appsubnet_NSG]
}
