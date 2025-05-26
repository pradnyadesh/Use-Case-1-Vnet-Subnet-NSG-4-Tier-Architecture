#websubnet name 
variable "websubnet_name" {
  type = string
  description = "Subnet name"
  default = "websubnet"
}

#websubnet address prefix
variable "websubnet_addressprefix" {
  type = list(string)
  description = "webSubnet address prefixes "
  default = ["10.0.0.0/20"]
}
#appsubnet name
variable "appsubnet_name" {
  type = string
  description = "Subnet name"
  default = "appsubnet"
}

#appsubnet addressprefix
variable "appsubnet_addressprefix" {
  type = list(string)
  description = "appsubnet address prefixes "
  default = ["10.0.16.0/20"]
}

#dbsubnet
variable "dbsubnet_name"{
type = string
description = "DBsubnet"
default = "dbsubnet"
}

variable "dbsubnet_addressprefix"{
  type = list(string)
  description = "dbsubnetaddress prefix "
  default = ["10.0.32.0/20"]
}

variable "bastionsubnet_name"{
type = string
description = "Bastion subnet"
default = "bastionsubnet"
}

variable "bastionsubnet_addressprefix"{
  type = list(string)
  description = "bastionsubnetaddress prefix "
  default = ["10.0.48.0/20"]
}
