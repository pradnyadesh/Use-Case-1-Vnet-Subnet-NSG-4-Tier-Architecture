#Virtual Network

variable "vnetname" {
 description = "Vnet Name"
 type = string

}

variable "vnet_addressspace" {
  description = "vnet address space"
  type = list(string)
}