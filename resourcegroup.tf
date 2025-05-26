#Resource Group

resource "azurerm_resource_group" "RG" {
  name = "${local.Resourcenameprefix}-${var.ResourceGroup}"
  location = var.ResouceLocation
  tags = local.common_Tags
}
