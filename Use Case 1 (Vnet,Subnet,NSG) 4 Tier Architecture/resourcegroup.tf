#Resource Group

resource "azurerm_resource_group" "RG" {
  name = "${local.Resourcenameprefix}-${var.ResourceGroup}-${ranrandom_string.myrandom.id}"
  location = var.ResouceLocation
  tags = local.common_Tags
}
