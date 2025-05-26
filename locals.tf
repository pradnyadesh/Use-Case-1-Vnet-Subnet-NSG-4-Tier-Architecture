locals {
  owners = var.Business_Unit
  Environment = var.Environment

  common_Tags = {
    owners = var.Business_Unit
    Environment= var.Environment
  }
  Resourcenameprefix = "${var.Business_Unit}-${var.Environment}"
}


#ports for inbound rules 22,3389,443,80
locals {
  security_rule_ports={
    "110" : "22"
    "120" : "3389"
    "130" : "443"
    "140" : "80"
  #If the key starts with number use ":" else use "="
  }
}