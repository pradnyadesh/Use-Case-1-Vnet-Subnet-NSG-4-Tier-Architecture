#Bastion subnet 
resource "azurerm_subnet" "bastionsubnet" {
  name = "${var.vnetname}-${var.bastionsubnet_name}"
  virtual_network_name = var.vnetname
  resource_group_name = var.ResourceGroup
  address_prefixes = var.bastionsubnet_addressprefix
  depends_on = [ azurerm_virtual_network.vnet ]
}

#websubnet NSG
resource "azurerm_network_security_group" "bastionsubnet_NSG" {
  resource_group_name = var.ResourceGroup
  location = var.ResouceLocation
  name = azurerm_subnet.bastionsubnet.name
  depends_on = [ azurerm_subnet.bastionsubnet ]
}

#websubnet NSG rule 

resource "azurerm_network_security_rule" "bastionsubnet_rule" {
  for_each = local.security_rule_ports
  resource_group_name = var.ResourceGroup
  network_security_group_name = azurerm_network_security_group.bastionsubnet_NSG.name
  name = "bastionsubnet_rule_${each.value}"
  priority = each.key
  protocol = "Tcp"
  direction = "Inbound"
  access = "Allow"
  destination_port_range = each.value
}

resource "azurerm_subnet_network_security_group_association" "associtebastionsubnet" {
  subnet_id = azurerm_subnet.bastionsubnet.id
  network_security_group_id = azurerm_network_security_group.bastionsubnet_NSG.id
  depends_on = [ azurerm_network_security_group.bastionsubnet_NSG]
}
