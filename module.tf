terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=3.0.1"
    }
  }
}

provider "azurerm" {
  features {}

}

module "sub1" {
    source = "./subnet"
    subnet_name = "sub1"
    subnet_CIDR = "10.0.1.0/24"
    rg_name = "rg01-b1"
    vnet-name = "example-network"
    
}
resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = "East US"
  resource_group_name = "rg01-b1"
}