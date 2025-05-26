#Virtual Network

resource "azurerm_virtual_network" "vnet" {
  name = "${local.Resourcenameprefix}-${var.vnetname}"
  location = var.ResouceLocation
  resource_group_name = azurerm_resource_group.RG.name
  address_space = var.vnet_addressspace
  tags = local.common_Tags
  depends_on = [ azurerm_resource_group.RG ]
}
