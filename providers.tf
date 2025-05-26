terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.28.0"
    }

     random = {
      source = "hashicorp/random"
      version = "3.7.2"
  }
}
}

provider "azurerm" {
  # Configuration options
  features {
  
  }
  subscription_id = "a96db7f9-f077-48d6-9d2e-68075185bc77"
  tenant_id = "b3e33edc-ced7-433a-9f35-93df9317d7a4"
  client_id = "65d199e5-f822-4b65-97a3-9c1b83894ed4"
  client_secret = "R5p8Q~jS_CTaNxeApL4yTgobP6N7Cp1.7l61aden"

}