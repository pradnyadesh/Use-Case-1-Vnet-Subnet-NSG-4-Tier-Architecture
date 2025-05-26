# Input Variable Business Unit/Department 
variable "Business_Unit" {
  description = "Business Department in which the azure resources are needed"
  type = string
}

#Input Variable for Environment
variable "Environment" {
  description = "Environment Type "
  type = string
  default = "Dev"
  }

#Input Variable for Resource Group name 

variable "ResourceGroup" {
  description = "Resource Group Name"
  type = string

}

#Input Variable for Resource Location

variable "ResouceLocation" {
  description = "Resource location "
  type = string
  default = "Central India"
}

