locals {
  owners = var.Business_Unit
  Environment = var.Environment
  common_Tags = {
    
    owners = locals.owners
    Environment= locals.Environment

  }
  Resourcenameprefix = "${var.Business_Unit}-${var.Environment}"
}